import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:logging/logging.dart';

abstract class BaseVoteApi {
  Future<String> add(VoteModel vote);
  Future<void> removeAllByUserID(String userID);
  Future<List<VoteModel>> getsByQuestion(String questionID);
}

class VoteFirebaseApi implements BaseVoteApi {
  final _logger = Logger("VoteApi");

  FirebaseFirestore _instance;

  VoteFirebaseApi({FirebaseFirestore instance}) {
    this._instance = instance ?? FirebaseFirestore.instance;
  }

  Future<List<VoteModel>> getsByQuestion(String questionID) async {
    final votesDocuments = await _instance
        .collection(CollectionNames.collectionNameVotes)
        .where('questionID', isEqualTo: questionID)
        .get();

    if (votesDocuments.docs == null && votesDocuments.docs.isEmpty)
      return <VoteModel>[];

    final votes = votesDocuments.docs
        .map((voteDocument) => VoteModel.fromJson(voteDocument.data()))
        .toList();

    return votes;
  }

  Future<List<VoteModel>> getsByQuestionAndAnswer(
      String questionID, String answerID) async {
    final votesDocuments = await _instance
        .collection(CollectionNames.collectionNameVotes)
        .where('questionID', isEqualTo: questionID)
        .where("answerID", isEqualTo: answerID)
        .get();

    if (votesDocuments.docs == null && votesDocuments.docs.isEmpty)
      return <VoteModel>[];

    final votes = votesDocuments.docs
        .map((voteDocument) => VoteModel.fromJson(voteDocument.data()))
        .toList();

    return votes;
  }

  @override
  Future<String> add(VoteModel vote) async {
    final json = vote.toJson();
    final document = await _instance
        .collection(CollectionNames.collectionNameVotes)
        .add(json);

    final jsonWithID = vote.copyWith.call(id: document.id).toJson();

    await document.set(jsonWithID);
    return document.id;
  }

  @override
  Future<void> removeAllByUserID(String userID) async {
    final userReference = _instance
        .collection(CollectionNames.collectionNameVotes)
        .where('userID', isEqualTo: userID);

    final snapshot = await userReference.get();

    if (snapshot.docs.isNotEmpty) {
      await Future.forEach(snapshot.docs, (element) async {
        if (element.exists) {
          await element.reference.delete();
        }
      });
    }
  }
}
