import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/services/base_firestore_api.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/utils/log_messages.dart';

abstract class BaseUserApi {
  Future<UserModel> get(String id);
  Future<String> add(UserModel user);
  Future<bool> isVotedThisQuestion(String userID, String questionID);
  Future<bool> remove(String id);
}

class UserFirebaseApi extends BaseFirestoreApi implements BaseUserApi {
  UserFirebaseApi({FirebaseFirestore instance})
      : super(
            path: CollectionNames.collectionNameUsers,
            instance: instance ?? FirebaseFirestore.instance,
            logger: Logger("UserFirebaseApi"));

  Future<UserModel> get(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null || id.isEmpty) return null;

    final json = await getData(id);
    if (json == null) {
      logger.shout("get() : json null");
      return null;
    }

    final user = UserModel.fromJson(json);
    return user;
  }

  Future<String> add(UserModel user) async {
    assert(user != null);
    if (user == null) return null;

    final id = await addData(user.toJson());
    return id;
  }

  Future<bool> isVotedThisQuestion(String userID, String questionID) async {
    assert(userID != null && userID.isNotEmpty);
    assert(questionID != null && questionID.isNotEmpty);

    if (userID == null || userID.isEmpty) return null;
    if (questionID == null || questionID.isEmpty) return null;

    final query = await instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: userID)
        .where("questionID", isEqualTo: questionID)
        .get();

    final isVoted = (query.docs != null) && query.docs.isNotEmpty;

    isVoted
        ? logger
            .info("isVotedThisQuestion() : ${LogMessages.votedThisQuestion}")
        : logger.info(
            "isVotedThisQuestion() : ${LogMessages.notVotedThisQuestion}");

    return isVoted;
  }

  @override
  Future<bool> remove(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    // ilk önce kullanıcının yanıtlarını silelim
    final votes = await instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: id)
        .get();

    if (votes.docs.length > 1) {
      await Future.forEach<QueryDocumentSnapshot>(votes.docs, (vote) async {
        if (vote.exists) {
          await vote.reference.delete();
        }
      });
    }

    // son olarak kullanıcıyı kaldırıyoruz
    final result = await removeData(id);
    return result;
  }
}
