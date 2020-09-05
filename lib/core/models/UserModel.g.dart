// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$_$_UserModelFromJson(Map json) {
  return _$_UserModel(
    id: json['id'] as String,
    age: json['age'] as int,
    gender: _$enumDecodeNullable(_$GenderEnumMap, json['gender']),
    city: json['city'] == null
        ? null
        : CityModel.fromJson((json['city'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    createdDate: json['createdDate'] as int,
    point: json['point'] as int ?? 0,
  );
}

Map<String, dynamic> _$_$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'age': instance.age,
      'gender': _$GenderEnumMap[instance.gender],
      'city': instance.city?.toJson(),
      'createdDate': instance.createdDate,
      'point': instance.point,
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
