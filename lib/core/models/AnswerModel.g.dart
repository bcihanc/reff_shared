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
        MyColor.transparent,
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
  MyColor.amber: 'amber',
  MyColor.black: 'black',
  MyColor.blue: 'blue',
  MyColor.blueGrey: 'blueGrey',
  MyColor.brown: 'brown',
  MyColor.cyan: 'cyan',
  MyColor.deepOrange: 'deepOrange',
  MyColor.deepPurple: 'deepPurple',
  MyColor.green: 'green',
  MyColor.grey: 'grey',
  MyColor.indigo: 'indigo',
  MyColor.lightBlue: 'lightBlue',
  MyColor.lightGreen: 'lightGreen',
  MyColor.lime: 'lime',
  MyColor.orange: 'orange',
  MyColor.pink: 'pink',
  MyColor.purple: 'purple',
  MyColor.red: 'red',
  MyColor.teal: 'teal',
  MyColor.transparent: 'transparent',
  MyColor.white: 'white',
  MyColor.yellow: 'yellow',
};
