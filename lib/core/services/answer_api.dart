import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/services/base_firestore_api.dart';
import 'package:reff_shared/core/utils/constants.dart';

abstract class BaseAnswerApi {
  Future<AnswerModel> get(String id);
  Future<List<String>> adds(List<AnswerModel> answers);
  Future<bool> update(String id, AnswerModel answer);
  Future<List<AnswerModel>> gets(List<String> ids);
  Future<List<AnswerModel>> getsByQuestion(String questionID);
  Future<bool> remove(String id);
}

class AnswerFirestoreApi extends BaseFirestoreApi implements BaseAnswerApi {
  AnswerFirestoreApi({FirebaseFirestore instance})
      : super(
            path: CollectionNames.collectionNameAnswers,
            instance: instance ?? FirebaseFirestore.instance,
            logger: Logger("AnswerFirestoreApi"));

  @override
  Future<AnswerModel> get(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    final data = await getData(id);
    return (data != null) ? AnswerModel.fromJson(data) : null;
  }

  Future<List<AnswerModel>> gets(List<String> ids) async {
    assert(ids != null && ids.isNotEmpty);
    if (ids == null && ids.isEmpty) return null;

    final answers = <AnswerModel>[];

    final dataList = await getsDatas(ids);

    if (dataList == null && dataList.isEmpty) {
      logger.shout("gets() : dataList boş");
      return null;
    }

    for (final data in dataList) {
      if (data != null) {
        answers.add(AnswerModel.fromJson(data));
      }
    }
    return answers;
  }

  Future<List<String>> adds(List<AnswerModel> answers) async {
    assert(answers != null && answers.isNotEmpty);
    if (answers == null && answers.isEmpty) return null;

    final answersIDs = <String>[];

    await Future.forEach<AnswerModel>(answers, (answer) async {
      final id = await addData(answer.toJson());
      if (id != null) {
        answersIDs.add(id);
      }
    });
    return (answersIDs.isNotEmpty) ? answersIDs : null;
  }

  Future<bool> update(String id, AnswerModel newAnswer) async {
    assert(id != null && id.isNotEmpty);
    assert(newAnswer != null);
    if (id == null && id.isEmpty) return null;
    if (newAnswer == null) return null;

    final result = await updateData(id, newAnswer.toJson());
    return result;
  }

  Future<bool> remove(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    final result = await removeData(id);
    return result;
  }

  @override
  Future<List<AnswerModel>> getsByQuestion(String questionID) async {
    assert(questionID != null && questionID.isNotEmpty);
    if (questionID == null && questionID.isEmpty) return null;

    final questionDoc = await instance
        .collection(CollectionNames.collectionNameQuestions)
        .doc(questionID);

    final questionReference = await questionDoc.get();
    final questionExists = questionReference.exists;

    if (!questionExists) return null;

    final question = QuestionModel.fromJson(questionReference.data());
    final answersIDs = question.answers;
    final answers = await gets(answersIDs);

    return (answers != null && answers.isNotEmpty) ? answers : null;
  }
}
