// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VoteModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerModel _$_$_AnswerModelFromJson(Map json) {
  return _$_AnswerModel(
    id: json['id'] as String,
    userID: json['userID'] as String,
    age: json['age'] as int,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    city: json['city'] == null
        ? null
        : CityModel.fromJson((json['city'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    questionID: json['questionID'] as String,
    answerID: json['answerID'] as String,
    createdDate: json['createdDate'] as int,
  );
}

Map<String, dynamic> _$_$_AnswerModelToJson(_$_AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'city': instance.city?.toJson(),
      'questionID': instance.questionID,
      'answerID': instance.answerID,
      'createdDate': instance.createdDate,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.others: 'others',
};
