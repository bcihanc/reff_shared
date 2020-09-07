import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/utils/constants.dart';

abstract class BaseAnswerApi {
  Future<AnswerModel> get(String id);
  Future<List<String>> adds(List<AnswerModel> answers);
  Future<void> update(String id, AnswerModel answer);
  Future<List<AnswerModel>> gets(List<String> ids);
  Future<List<AnswerModel>> getsByQuestion(String questionID);
  Future<void> remove(String id);
}

class AnswerFirestoreApi implements BaseAnswerApi {
  final _logger = Logger("AnswerApi");

  FirebaseFirestore _instance;
  AnswerFirestoreApi({FirebaseFirestore instance}) {
    _instance = instance ?? FirebaseFirestore.instance;
  }

  Future<void> update(String id, AnswerModel answer) async {
    await _instance
        .collection(CollectionNames.collectionNameAnswers)
        .doc(id)
        .update(answer.toJson());
    _logger.info("updateAnswer");
  }

  @override
  Future<List<AnswerModel>> getsByQuestion(String questionID) async {
    assert(questionID != null);

    final questionSnapshot = await _instance
        .collection(CollectionNames.collectionNameQuestions)
        .doc(questionID)
        .get();

    if (questionSnapshot.exists) {
      final question = QuestionModel.fromJson(questionSnapshot.data());
      final answersIDs = question.answers;
      final answers = await gets(answersIDs);
      return answers;
    } else {
      return null;
    }
  }

  Future<List<AnswerModel>> gets(List<String> ids) async {
    assert(ids != null && ids.isNotEmpty);
    final answers = <AnswerModel>[];

    await Future.forEach(ids, (id) async {
      final answer = await get(id);
      answers.add(answer);
    });

    return answers;
  }

  Future<AnswerModel> get(String id) async {
    assert(id != null);
    final snapshot = await _instance
        .collection(CollectionNames.collectionNameAnswers)
        .doc(id)
        .get();

    if (snapshot.exists) {
      return AnswerModel.fromJson(snapshot.data());
    } else {
      return null;
    }
  }

  Future<List<String>> adds(List<AnswerModel> answers) async {
    assert(answers != null && answers.isNotEmpty);

    final answersIDs = <String>[];

    await Future.forEach(answers, (answer) async {
      final reference = await _instance
          .collection(CollectionNames.collectionNameAnswers)
          .add(answer.toJson());
      final withID = answer.copyWith.call(id: reference.id);
      await reference.set(withID.toJson());

      answersIDs.add(reference.id);
    });

    return answersIDs;
  }

  Future<void> remove(String id) async {
    await _instance
        .collection(CollectionNames.collectionNameAnswers)
        .doc(id)
        .delete()
        .catchError((e) => throw Exception(e));

    _logger.finer("removeAnswer");
  }
}
