import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reff_shared/core/models/CityModel.dart';

part 'UserModel.freezed.dart';
part 'UserModel.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    @nullable String id,
    @required int age,
    @required Gender gender,
    @required CityModel city,
    @required int createdDate,
    @Default(0) int point,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  int get calculatedAge =>
      DateTime.now().year -
      DateTime.fromMillisecondsSinceEpoch(createdDate).year +
      this.age;
}

enum Gender { MALE, FEMALE, OTHERS }
