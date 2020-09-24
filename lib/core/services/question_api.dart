import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:reff_shared/core/services/base_firestore_api.dart';
import 'package:reff_shared/core/utils/constants.dart';

abstract class BaseQuestionApi {
  Future<QuestionModel> get(String questionID);
  Stream<List<QuestionModel>> getsSnapshots({
    DateTime afterDateTime,
    bool onlyActiveQuestions,
    CityModel city,
  });
  Future<String> add(QuestionModel question);
  Future<bool> update(String id, QuestionModel question);
  Future<bool> remove(String id);
  Future<List<QuestionModel>> gets({
    DateTime afterDateTime,
    bool onlyActiveQuestions = false,
    CityModel city,
  });

  Stream<List<String>> getUserVotesIDs(String userID, String questionID);
}

class QuestionFirestoreApi extends BaseFirestoreApi implements BaseQuestionApi {
  QuestionFirestoreApi({FirebaseFirestore instance})
      : super(
            path: CollectionNames.collectionNameQuestions,
            instance: instance ?? FirebaseFirestore.instance,
            logger: Logger("QuestionFirestoreApi"));

  // TODO: bunun votesa taşınması gerekiyor
  @override
  Stream<List<String>> getUserVotesIDs(String userID, String questionID) {
    assert(userID != null && userID.isNotEmpty);
    assert(questionID != null && questionID.isNotEmpty);

    if (userID == null && userID.isEmpty) return null;
    if (questionID == null && questionID.isEmpty) return null;

    final snapshots = instance
        .collection(CollectionNames.collectionNameVotes)
        .where("userID", isEqualTo: userID)
        .where("questionID", isEqualTo: questionID)
        .snapshots();

    return snapshots
        .map((questions) => questions.docs.map((json) => json.id).toList());
  }

  @override
  Future<QuestionModel> get(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    final data = await getData(id);
    return (data != null) ? QuestionModel.fromJson(data) : null;
  }

  @override
  Stream<List<QuestionModel>> getsSnapshots({
    DateTime afterDateTime,
    bool onlyActiveQuestions = false,
    CityModel city,
  }) {
    final query = instance
        .collection(CollectionNames.collectionNameQuestions)
        .after(afterDateTime)
        .cityNameFilter(city);

    final snapshots =
        (onlyActiveQuestions ? query.onlyIsActive() : query).snapshots();

    final questionsStream = snapshots
        .map((snapshot) => (snapshot.docs.isNotEmpty) ? snapshot.docs : null)
        ?.map((docs) {
      if (docs != null && docs.isNotEmpty) {
        return docs
            .map((questionData) => (questionData.exists)
                ? QuestionModel.fromJson(questionData.data())
                : null)
            ?.toList();
      } else {
        return <QuestionModel>[];
      }
    });

    return questionsStream;
  }

  Future<List<String>> getsIDs({
    DateTime afterDateTime,
    bool onlyActiveQuestions = false,
    CityModel city,
  }) async {
    final query = instance
        .collection(CollectionNames.collectionNameQuestions)
        .after(afterDateTime)
        .cityNameFilter(city);

    final snapshots =
        await (onlyActiveQuestions ? query.onlyIsActive() : query).get();
    return snapshots.docs.map((doc) => doc.id).toList() ?? <String>[];
  }

  @override
  Future<String> add(QuestionModel question) async {
    assert(question != null);
    if (question == null) return null;

    final id = await addData(question.toJson());
    return id;
  }

  @override
  Future<bool> update(String id, QuestionModel newQuestionModel) async {
    assert(id != null && id.isNotEmpty);
    assert(newQuestionModel != null);

    if (id == null && id.isEmpty) return null;
    if (newQuestionModel == null) return null;

    final result = await updateData(id, newQuestionModel.toJson());
    return result;
  }

  // todo: tekrar düzenlemesi gerek
  @override
  Future<bool> remove(String id) async {
    assert(id != null && id.isNotEmpty);
    if (id == null && id.isEmpty) return null;

    // ilk önce cevapları silelim
    final document =
        instance.collection(CollectionNames.collectionNameQuestions).doc(id);

    final refence = await document.get();
    final questionExists = refence.exists;
    if (!questionExists) {
      logger.shout("remove() silinecek soru bulunamadı");
      return false;
    }

    final question = QuestionModel.fromJson(refence.data());

    await Future.forEach(question.answers, (answerID) async {
      final answer = instance
          .collection(CollectionNames.collectionNameAnswers)
          .doc(answerID);

      final exisist = (await answer.get()).exists;
      if (!exisist) {
        logger.shout("remove() silinecek cevap bulunamadı");
      }
      await answer.delete();
    });
    await document.delete();
    logger.info("remove()");
    return true;
  }

  @override
  Future<List<QuestionModel>> gets(
      {DateTime afterDateTime,
      bool onlyActiveQuestions = false,
      CityModel city}) async {
    final query = instance
        .collection(CollectionNames.collectionNameQuestions)
        .after(afterDateTime)
        .cityNameFilter(city);

    final snapshots =
        await (onlyActiveQuestions ? query.onlyIsActive() : query).get();
    return snapshots.docs
            .map((doc) => QuestionModel.fromJson(doc.data()))
            .toList() ??
        <QuestionModel>[];
  }
}

extension QueryExtension on Query {
  Query onlyIsActive() => where("isActive", isEqualTo: true);

  Query after(DateTime dateTime) {
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
