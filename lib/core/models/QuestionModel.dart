import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reff_shared/core/models/CityModel.dart';

part 'QuestionModel.freezed.dart';
part 'QuestionModel.g.dart';

@freezed
abstract class QuestionModel with _$QuestionModel {
  const factory QuestionModel(
      {@nullable String id,
      @required String header,
      @nullable String content,
      @nullable List<String> answers,
      @nullable String imageUrl,
      @required int startDate,
      @required int endDate,
      @required CityModel city,
      @Default(0) int likes,
      @Default(0) int disLikes,
      @Default(false) bool isActive}) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}

extension TimeStamp on int {
  DateTime toDateTime() => DateTime.fromMillisecondsSinceEpoch(this);
}
