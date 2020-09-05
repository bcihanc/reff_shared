import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reff_shared/core/models/models.dart';

part 'VoteModel.freezed.dart';
part 'VoteModel.g.dart';

@freezed
abstract class VoteModel with _$VoteModel {
  const factory VoteModel({
    @nullable String id,
    @required String userID,
    @required int age,
    @required Gender gender,
    @required CityModel city,
    @required String questionID,
    @required String answerID,
    @required int createdDate,
  }) = _AnswerModel;

  factory VoteModel.fromJson(Map<String, dynamic> json) =>
      _$VoteModelFromJson(json);
}
