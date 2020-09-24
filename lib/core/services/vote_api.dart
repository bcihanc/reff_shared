import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/services/base_firestore_api.dart';
import 'package:reff_shared/core/utils/constants.dart';

abstract class BaseVoteApi {
  Future<String> add(VoteModel vote);
  Future<void> removeAllByUserID(String userID);
  Future<List<VoteModel>> getsByQuestion(String questionID);
  Future<List<VoteModel>> getsByQuestionAndAnswer(
      String questionID, String answerID);
}

class VoteFirebaseApi extends BaseFirestoreApi implements BaseVoteApi {
  VoteFirebaseApi({FirebaseFirestore instance})
      : super(
            path: CollectionNames.collectionNameVotes,
            instance: instance ?? FirebaseFirestore.instance,
            logger: Logger("VoteFirebaseApi"));

  Future<List<VoteModel>> getsByQuestion(String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final votesDocuments = await instance
        .collection(CollectionNames.collectionNameVotes)
        .where('questionID', isEqualTo: questionID)
        .get();

    if (votesDocuments.docs == null && votesDocuments.docs.isEmpty) {
      return <VoteModel>[];
    }

    final votes = votesDocuments.docs
        .map((voteDocument) => VoteModel.fromJson(voteDocument.data()))
        .toList();

    return votes;
  }

  Future<List<VoteModel>> getsByQuestionAndAnswer(
      String questionID, String answerID) async {
    assert(questionID != null && questionID.isNotEmpty);
    assert(answerID != null && answerID.isNotEmpty);

    if (questionID == null && questionID.isEmpty) return null;
    if (answerID == null && answerID.isEmpty) return null;

    final votesDocuments = await instance
        .collection(CollectionNames.collectionNameVotes)
        .where('questionID', isEqualTo: questionID)
        .where("answerID", isEqualTo: answerID)
        .get();

    if (votesDocuments.docs == null && votesDocuments.docs.isEmpty) {
      return <VoteModel>[];
    }

    final votes = votesDocuments.docs
        .map((voteDocument) => VoteModel.fromJson(voteDocument.data()))
        .toList();

    return votes;
  }

  @override
  Future<String> add(VoteModel vote) async {
    assert(vote != null);
    if (vote == null) return null;

    final id = addData(vote.toJson());
    return id;
  }

  @override
  Future<bool> removeAllByUserID(String userID) async {
    assert(userID != null && userID.isNotEmpty);
    if (userID == null && userID.isEmpty) return null;

    final userReference = instance
        .collection(CollectionNames.collectionNameVotes)
        .where('userID', isEqualTo: userID);

    final snapshot = await userReference.get();

    if (snapshot.size == 0) {
      logger.shout("removeAllByUserID : kullanıcıyla ilgili oy bulunamadı");
      return false;
    }

    if (snapshot.docs.isNotEmpty) {
      await Future.forEach(snapshot.docs, (element) async {
        if (element.exists) {
          await element.reference.delete();
        }
      });
    }
    return true;
  }
}
