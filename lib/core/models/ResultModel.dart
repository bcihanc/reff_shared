import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:reff_shared/core/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reff_shared/core/services/services.dart';
import 'package:reff_shared/core/utils/constants.dart';

part 'ResultModel.freezed.dart';
part 'ResultModel.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel(
      {@nullable String id,
      @required String questionID,
      @required List<String> answers,
      @required Map<String, Map<int, int>> agesMap,
      @required Map<String, Map<Gender, int>> gendersMap,
      @required Map<String, Map<String, int>> cityNameMap}) = _ResultModel;

  factory ResultModel.fromJson(Map<String, dynamic> json) =>
      _$ResultModelFromJson(json);
}

class ResultModelHelper {
  static Map<String, Map<int, int>> createAgeMap(
      Map<String, List<VoteModel>> answersWithVotes) {
    return answersWithVotes.map((answerID, votes) {
      final ages = List.generate(100, (index) => index);
      final agesMap =
          Map<int, int>.fromIterable(ages, key: (age) => age, value: (_) => 0);

      votes.forEach((vote) => agesMap.update(vote.age, (value) => value + 1));
      agesMap.removeWhere((key, value) => value == 0);

      final sortedAgesMap = _sortedMapByValue<int>(agesMap);
      return MapEntry(answerID, sortedAgesMap);
    });
  }

  static Map<String, Map<Gender, int>> createGenderMap(
      Map<String, List<VoteModel>> answersWithVotes) {
    return answersWithVotes.map((answerID, votes) {
      final genderMap = Map<Gender, int>.fromIterable(Gender.values,
          key: (gender) => gender, value: (_) => 0);

      votes.forEach(
          (vote) => genderMap.update(vote.gender, (value) => value + 1));
      genderMap.removeWhere((key, value) => value == 0);

      final sortedGenderMap = _sortedMapByValue<Gender>(genderMap);
      return MapEntry(answerID, sortedGenderMap);
    });
  }

  static Map<String, Map<String, int>> createCityNameMap(
      Map<String, List<VoteModel>> answersWithVotes) {
    return answersWithVotes.map((answerID, votes) {
      final cityMap = Map<CityModel, int>.fromIterable(CityModel.cities,
          key: (city) => city, value: (_) => 0);

      votes.forEach((vote) => cityMap.update(vote.city, (value) => value + 1));
      cityMap.removeWhere((key, value) => value == 0);
      final cityNameMap =
          cityMap.map((key, value) => MapEntry(key.name, value));
      final sortedCityNameMap = _sortedMapByValue<String>(cityNameMap);
      return MapEntry(answerID, sortedCityNameMap);
    });
  }
}

Map<T, int> _sortedMapByValue<T>(Map<T, int> map) {
  final sorted = map.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));
  return Map.fromEntries(sorted);
}

class ResultFirestoreApi {
  final _logger = Logger("ResultFirestoreApi");

  FirebaseFirestore _instance;

  ResultFirestoreApi({FirebaseFirestore instance}) {
    this._instance = instance ?? FirebaseFirestore.instance;
  }

  Future<ResultModel> getByQuestion(String questionID) async {
    final snapshot = await _instance
        .collection(CollectionNames.collectionNameResults)
        .where("questionID", isEqualTo: questionID)
        .get();

    if (snapshot.docs.isNotEmpty) {
      return ResultModel.fromJson(snapshot.docs.first.data());
    } else
      return null;
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

    final result = ResultModel(
        questionID: questionID,
        answers: withVotes.keys.toList(),
        agesMap: agesMap,
        gendersMap: gendersMap,
        cityNameMap: citiesNameMap);

    return await this.create(result);
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
}
