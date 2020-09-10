import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/utils/log_messages.dart';

abstract class BaseUserApi {
  Future<UserModel> get(String id);
  Future<String> createUser(UserModel user);
  Future<bool> isVotedThisQuestion(String userID, String questionID);
  Future<void> remove(String userID);
}

class UserFirebaseApi implements BaseUserApi {
  final _logger = Logger("UserFirestoreApi");

  FirebaseFirestore _instance;

  UserFirebaseApi({FirebaseFirestore instance}) {
    _instance = instance ?? FirebaseFirestore.instance;
  }

  /// return user's [documentID]
  Future<String> createUser(UserModel user) async {
    final json = user.toJson();

    final document = await _instance
        .collection(CollectionNames.collectionNameUsers)
        .add(json);

    final exsist = (await document.get()).exists;

    if (exsist) {
      final withID = user.copyWith.call(id: document.id);
      await document.set(withID.toJson());

      _logger.info(LogMessages.created(document.id));
      return document.id;
    } else {
      _logger.shout(LogMessages.notCreated);
      return null;
    }
  }

  Future<UserModel> get(String id) async {
    final document = await _instance
        .collection(CollectionNames.collectionNameUsers)
        .doc(id)
        .get();

    if (document.exists) {
      _logger.info(LogMessages.found(document.id));
      return UserModel.fromJson(document.data());
    } else {
      _logger.shout(LogMessages.notFound);
      return null;
    }
  }

  Future<bool> isVotedThisQuestion(String userID, String questionID) async {
    final query = await _instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: userID)
        .where("questionID", isEqualTo: questionID)
        .get();

    final isVoted = (query.docs != null) && query.docs.isNotEmpty;

    isVoted
        ? _logger.info(LogMessages.votedThisQuestion)
        : _logger.info(LogMessages.notVotedThisQuestion);

    return isVoted;
  }

  @override
  Future<void> remove(String userID) async {
    // ilk önce kullanıcının yanıtlarını silelim
    final votes = await _instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: userID)
        .get();
    if (votes.size > 0) {
      for (final vote in votes.docs) {
        if (vote.exists) {
          await vote.reference.delete();
        }
      }

      await Future.forEach<QueryDocumentSnapshot>(
          votes.docs, (vote) async => await vote.reference.delete());
    }

    // son olarak kullanıcıyı kaldırıyoruz
    await _instance
        .collection(CollectionNames.collectionNameUsers)
        .doc(userID)
        .delete();
  }
}
