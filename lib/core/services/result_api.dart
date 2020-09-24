import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/services/services.dart';
import 'package:reff_shared/core/services/base_firestore_api.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/models/models.dart';

abstract class BaseResultApi {
  Future<ResultModel> getByQuestion(String questionID);
  Future<String> add(ResultModel result);
  Future<String> addFromQuestion(String questionID);
  Future<Map<String, List<VoteModel>>> createAnswerWithVotes(String questionID);
  Future<bool> remove(String resultID);
  Future<bool> isHaveResultByQuestionID(String questionID);
}

class ResultFirestoreApi extends BaseFirestoreApi implements BaseResultApi {
  ResultFirestoreApi({FirebaseFirestore instance})
      : super(
            path: CollectionNames.collectionNameResults,
            instance: instance ?? FirebaseFirestore.instance,
            logger: Logger("ResultFirestoreApi"));

  Future<ResultModel> getByQuestion(String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final snapshot = await instance
        .collection(CollectionNames.collectionNameResults)
        .where("questionID", isEqualTo: questionID)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ResultModel.fromJson(snapshot.docs.first.data());
    } else {
      return null;
    }
  }

  Future<String> add(ResultModel result) async {
    assert(result != null);
    if (result == null) return null;

    final id = await addData(result.toJson());
    return id;
  }

  Future<String> addFromQuestion(String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final withVotes = await createAnswerWithVotes(questionID);

    final agesMap = ResultModelHelper.createAgeMap(withVotes);
    final gendersMap = ResultModelHelper.createGenderMap(withVotes);
    final citiesNameMap = ResultModelHelper.createCityNameMap(withVotes);
    final educationMap = ResultModelHelper.createEducationMap(withVotes);

    final result = ResultModel(
        questionID: questionID,
        answers: withVotes.keys.toList(),
        agesMap: agesMap,
        gendersMap: gendersMap,
        cityNameMap: citiesNameMap,
        educationMap: educationMap);

    return await add(result);
  }

  Future<Map<String, List<VoteModel>>> createAnswerWithVotes(
      String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final answers = await AnswerFirestoreApi().getsByQuestion(questionID);

    final answersWithVotes = <String, List<VoteModel>>{};

    await Future.forEach<AnswerModel>(answers, (answer) async {
      final votes = await VoteFirebaseApi()
          .getsByQuestionAndAnswer(questionID, answer.id);

      answersWithVotes.addAll({answer.id: votes});
    });

    return answersWithVotes;
  }

  @override
  Future<bool> remove(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    final result = await removeData(id);
    return result;
  }

  @override
  Future<bool> isHaveResultByQuestionID(String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final snapshot = await instance
        .collection(CollectionNames.collectionNameResults)
        .where("questionID", isEqualTo: questionID)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
