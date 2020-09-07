import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reff_shared/core/models/models.dart';

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

      for (final vote in votes) {
        agesMap.update(vote.age, (value) => value + 1);
      }
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

      for (final vote in votes) {
        genderMap.update(vote.gender, (value) => value + 1);
      }

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

      for (final vote in votes) {
        cityMap.update(vote.city, (value) => value + 1);
      }

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
