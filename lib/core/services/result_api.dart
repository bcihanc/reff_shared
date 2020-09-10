import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/services/services.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/models/models.dart';

abstract class BaseResultApi {
  Future<ResultModel> getByQuestion(String questionID);
  Future<String> create(ResultModel result);
  Future<String> createFromQuestion(String questionID);
  Future<Map<String, List<VoteModel>>> createAnswerWithVotes(String questionID);
  Future<void> remove(String resultID);
}

class ResultFirestoreApi implements BaseResultApi {
  final _logger = Logger("ResultFirestoreApi");

  FirebaseFirestore _instance;

  ResultFirestoreApi({FirebaseFirestore instance}) {
    _instance = instance ?? FirebaseFirestore.instance;
  }

  Future<ResultModel> getByQuestion(String questionID) async {
    final snapshot = await _instance
        .collection(CollectionNames.collectionNameResults)
        .where("questionID", isEqualTo: questionID)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ResultModel.fromJson(snapshot.docs.first.data());
    } else {
      return null;
    }
  }

  Future<String> create(ResultModel result) async {
    final doc = await _instance
        .collection(CollectionNames.collectionNameResults)
        .add(result.toJson());

    final withID = result.copyWith.call(id: doc.id);
    await doc.set(withID.toJson());
    return doc.id;
  }

  Future<String> createFromQuestion(String questionID) async {
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

    return await create(result);
  }

  Future<Map<String, List<VoteModel>>> createAnswerWithVotes(
      String questionID) async {
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
  Future<void> remove(String resultID) async {
    await _instance
        .collection(CollectionNames.collectionNameResults)
        .doc(resultID)
        .delete();

    final doc = await _instance
        .collection(CollectionNames.collectionNameResults)
        .doc(resultID)
        .get();

    final result = doc.exists;

    result
        ? _logger.info("$resultID kaldırıldı")
        : _logger.info("$resultID kaldırılamadı‍");
  }
}
