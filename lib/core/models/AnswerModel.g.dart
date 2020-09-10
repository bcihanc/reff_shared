// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerModel _$_$_AnswerModelFromJson(Map json) {
  return _$_AnswerModel(
    id: json['id'] as String,
    content: json['content'] as String,
    imageUrl: json['imageUrl'] as String,
    color: _$enumDecodeNullable(_$MyColorEnumMap, json['color']) ??
        MyColor.TRANSPARENT,
  );
}

Map<String, dynamic> _$_$_AnswerModelToJson(_$_AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'imageUrl': instance.imageUrl,
      'color': _$MyColorEnumMap[instance.color],
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

const _$MyColorEnumMap = {
  MyColor.AMBER: 'AMBER',
  MyColor.BLACK: 'BLACK',
  MyColor.BLUE: 'BLUE',
  MyColor.BLUE_GREY: 'BLUE_GREY',
  MyColor.BROWN: 'BROWN',
  MyColor.CYAN: 'CYAN',
  MyColor.DEEP_ORANGE: 'DEEP_ORANGE',
  MyColor.DEEP_PURPLE: 'DEEP_PURPLE',
  MyColor.GREEN: 'GREEN',
  MyColor.GREY: 'GREY',
  MyColor.INDIGO: 'INDIGO',
  MyColor.LIGHT_BLUE: 'LIGHT_BLUE',
  MyColor.LIGHT_GREEN: 'LIGHT_GREEN',
  MyColor.LIME: 'LIME',
  MyColor.ORANGE: 'ORANGE',
  MyColor.PINK: 'PINK',
  MyColor.PURPLE: 'PURPLE',
  MyColor.RED: 'RED',
  MyColor.TEAL: 'TEAL',
  MyColor.TRANSPARENT: 'TRANSPARENT',
  MyColor.WHITE: 'WHITE',
  MyColor.YELLOW: 'YELLOW',
};
