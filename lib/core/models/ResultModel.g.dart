// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ResultModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResultModel _$_$_ResultModelFromJson(Map json) {
  return _$_ResultModel(
    id: json['id'] as String,
    questionID: json['questionID'] as String,
    answers: (json['answers'] as List)?.map((e) => e as String)?.toList(),
    agesMap: (json['agesMap'] as Map)?.map(
      (k, e) => MapEntry(
          k as String,
          (e as Map)?.map(
            (k, e) => MapEntry(int.parse(k as String), e as int),
          )),
    ),
    gendersMap: (json['gendersMap'] as Map)?.map(
      (k, e) => MapEntry(
          k as String,
          (e as Map)?.map(
            (k, e) =>
                MapEntry(_$enumDecodeNullable(_$GenderEnumMap, k), e as int),
          )),
    ),
    cityNameMap: (json['cityNameMap'] as Map)?.map(
      (k, e) => MapEntry(
          k as String,
          (e as Map)?.map(
            (k, e) => MapEntry(k as String, e as int),
          )),
    ),
  );
}

Map<String, dynamic> _$_$_ResultModelToJson(_$_ResultModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questionID': instance.questionID,
      'answers': instance.answers,
      'agesMap': instance.agesMap?.map(
          (k, e) => MapEntry(k, e?.map((k, e) => MapEntry(k.toString(), e)))),
      'gendersMap': instance.gendersMap?.map((k, e) =>
          MapEntry(k, e?.map((k, e) => MapEntry(_$GenderEnumMap[k], e)))),
      'cityNameMap': instance.cityNameMap,
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
