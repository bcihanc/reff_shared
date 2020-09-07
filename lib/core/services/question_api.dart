import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/utils/constants.dart';
import 'package:reff_shared/core/utils/log_messages.dart';

abstract class BaseQuestionApi {
  Future<QuestionModel> get(String questionID);
  Future<void> update(String id, QuestionModel question);
  Future<String> add(QuestionModel question);
  Future<void> remove(String id);
  Stream<List<QuestionModel>> gets({
    DateTime dateTime,
    bool onlyActiveQuestions = false,
    CityModel cityName,
  });
  Stream<List<QuestionModel>> getsByUserUnAnswered(UserModel user);
  Stream<List<String>> getUserVotesIDs(String userID, String questionID);
}

class QuestionFirestoreApi extends BaseQuestionApi {
  final _logger = Logger("QuestionFirestoreApi");

  FirebaseFirestore _instance;
  QuestionFirestoreApi({FirebaseFirestore instance}) {
    _instance = instance ?? FirebaseFirestore.instance;
  }

  Stream<List<QuestionModel>> getsByUserUnAnswered(UserModel user) {
    final questionStream = gets(
        onlyActiveQuestions: true,
        dateTime: DateTime.now(),
        cityName: user.city);

    return questionStream.asyncMap((questions) async {
      _logger.info("gets : ${questions?.length} question is available");

      final avaibleQuestions = <QuestionModel>[];

      if (questions.isNotEmpty) {
        await Future.forEach(questions, (question) async {
          final document = await _instance
              .collection(CollectionNames.collectionNameVotes)
              .where("userID", isEqualTo: user.id)
              .where("questionID", isEqualTo: question.id)
              .get();

          final isVoted = document.docs.isNotEmpty;

          if (!isVoted) avaibleQuestions.add(question);
        });
      }

      return avaibleQuestions;
    });
  }

  Stream<List<String>> getUserVotesIDs(String userID, String questionID) {
    final snapshots = _instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: userID)
        .where("questionID", isEqualTo: questionID)
        .snapshots();

    return snapshots
        .map((questions) => questions.docs.map((json) => json.id).toList());
  }

  Stream<List<QuestionModel>> gets({
    DateTime dateTime,
    bool onlyActiveQuestions = false,
    String countryCode,
    CityModel cityName,
  }) {
    final snapshots = _instance
        .collection(CollectionNames.collectionNameQuestions)
        .onlyIsActive()
        .dateTimeRange(dateTime)
        .cityNameFilter(cityName)
        .snapshots();

    final questions = snapshots.map((snapshot) => snapshot.docs).map(
        (document) =>
            document.map((e) => QuestionModel.fromJson(e.data())).toList());

    return questions;
  }

  Future<QuestionModel> get(String questionID) async {
    final document = await _instance
        .collection(CollectionNames.collectionNameQuestions)
        .doc(questionID)
        .get();

    if (document.exists) {
      _logger.info(LogMessages.found(document.id));
      return QuestionModel.fromJson(document.data());
    } else {
      _logger.shout(LogMessages.notFound);
      return null;
    }
  }

  Future<void> update(String id, QuestionModel newQuestionModel) async {
    await _instance
        .collection(CollectionNames.collectionNameQuestions)
        .doc(id)
        .update(newQuestionModel.toJson());

    _logger.info(LogMessages.updated(id));
  }

  Future<String> add(QuestionModel question) async {
    final document = await _instance
        .collection(CollectionNames.collectionNameQuestions)
        .add(question.toJson());

    final exists = (await document.get()).exists;

    if (exists) {
      final withID = question.copyWith.call(id: document.id);
      await document.set(withID.toJson());

      _logger.info(LogMessages.created(document.id));
      return document.id;
    } else {
      _logger.shout(LogMessages.notCreated);
      return null;
    }
  }

  Future<void> remove(String id) async {
    // ilk önce cevapları silelim
    final document =
        _instance.collection(CollectionNames.collectionNameQuestions).doc(id);

    final refence = await document.get();

    if (refence.exists) {
      final question = QuestionModel.fromJson(refence.data());

      await Future.forEach(question.answers, (answerID) async {
        final answer = _instance
            .collection(CollectionNames.collectionNameAnswers)
            .doc(answerID);

        final exisist = (await answer.get()).exists;
        if (exisist) {
          await answer.delete();
          _logger.info("answer ${LogMessages.removed(answer.id)}");
        }
        // cavap bulunamadı
        else {
          _logger.shout("answer ${LogMessages.notRemoved(id)}");
        }
      });

      // daha sonra ilgili soruyu silebiliriz
      await document.delete();
      _logger.info("question ${LogMessages.removed(id)}");
    }
    // soru bulunamadı
    else {
      _logger.shout("question ${LogMessages.notRemoved(id)}");
    }
  }
}

extension QueryExtension on Query {
  Query onlyIsActive() => where("isActive", isEqualTo: true);

  Query dateTimeRange(DateTime dateTime) {
    return (dateTime != null)
        ? where('endDate', isGreaterThan: dateTime.millisecondsSinceEpoch)
        : this;
  }

  Query cityNameFilter(CityModel city) {
    return (city != null)
        ? where('city.name', whereIn: [city.name, city.countryName])
        : this;
  }
}
