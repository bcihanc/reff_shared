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
    @required Education education,
    @Default(0) int point,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  int get calculatedAge =>
      DateTime.now().year -
      DateTime.fromMillisecondsSinceEpoch(createdDate).year +
      age;

  static final initial = UserModel(
      age: 32,
      gender: Gender.MALE,
      education: Education.BACHELOR,
      city: CityModel(
          countryCode: "tr",
          name: "İstanbul",
          utc: 3,
          langCode: "tr",
          countryName: 'Turkey'),
      createdDate: DateTime.now().millisecondsSinceEpoch);
}

enum Gender { MALE, FEMALE, OTHERS }
enum Education { PRIMARY_EDUCATION, HIGH_SCHOOL, BACHELOR, MASTER }
