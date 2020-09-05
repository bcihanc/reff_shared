// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionModel _$_$_QuestionModelFromJson(Map json) {
  return _$_QuestionModel(
    id: json['id'] as String,
    header: json['header'] as String,
    content: json['content'] as String,
    answers: (json['answers'] as List)?.map((e) => e as String)?.toList(),
    imageUrl: json['imageUrl'] as String,
    startDate: json['startDate'] as int,
    endDate: json['endDate'] as int,
    city: json['city'] == null
        ? null
        : CityModel.fromJson((json['city'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    likes: json['likes'] as int ?? 0,
    disLikes: json['disLikes'] as int ?? 0,
    isActive: json['isActive'] as bool ?? false,
  );
}

Map<String, dynamic> _$_$_QuestionModelToJson(_$_QuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'content': instance.content,
      'answers': instance.answers,
      'imageUrl': instance.imageUrl,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'city': instance.city?.toJson(),
      'likes': instance.likes,
      'disLikes': instance.disLikes,
      'isActive': instance.isActive,
    };
