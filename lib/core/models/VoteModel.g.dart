// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VoteModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VoteModel _$_$_VoteModelFromJson(Map json) {
  return _$_VoteModel(
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
    education: _$enumDecodeNullable(_$EducationEnumMap, json['education']),
  );
}

Map<String, dynamic> _$_$_VoteModelToJson(_$_VoteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'city': instance.city?.toJson(),
      'questionID': instance.questionID,
      'answerID': instance.answerID,
      'createdDate': instance.createdDate,
      'education': _$EducationEnumMap[instance.education],
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
  Gender.MALE: 'MALE',
  Gender.FEMALE: 'FEMALE',
  Gender.OTHERS: 'OTHERS',
};

const _$EducationEnumMap = {
  Education.PRIMARY_EDUCATION: 'PRIMARY_EDUCATION',
  Education.HIGH_SCHOOL: 'HIGH_SCHOOL',
  Education.BACHELOR: 'BACHELOR',
  Education.MASTER: 'MASTER',
};
