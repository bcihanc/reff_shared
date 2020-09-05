// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CityModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CityModel _$_$_CityModelFromJson(Map json) {
  return _$_CityModel(
    countryCode: json['countryCode'] as String,
    countryName: json['countryName'] as String,
    langCode: json['langCode'] as String,
    name: json['name'] as String,
    utc: json['utc'] as int,
  );
}

Map<String, dynamic> _$_$_CityModelToJson(_$_CityModel instance) =>
    <String, dynamic>{
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'langCode': instance.langCode,
      'name': instance.name,
      'utc': instance.utc,
    };

_$_CountryModel _$_$_CountryModelFromJson(Map json) {
  return _$_CountryModel(
    name: json['name'] as String,
    capital: json['capital'] == null
        ? null
        : CityModel.fromJson((json['capital'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    code: json['code'] as String,
    langCode: json['langCode'] as String,
    cities: (json['cities'] as List)
        ?.map((e) => e == null
            ? null
            : CityModel.fromJson((e as Map)?.map(
                (k, e) => MapEntry(k as String, e),
              )))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_CountryModelToJson(_$_CountryModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capital': instance.capital?.toJson(),
      'code': instance.code,
      'langCode': instance.langCode,
      'cities': instance.cities?.map((e) => e?.toJson())?.toList(),
    };
