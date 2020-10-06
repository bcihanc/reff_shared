// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'VoteModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
VoteModel _$VoteModelFromJson(Map<String, dynamic> json) {
  return _VoteModel.fromJson(json);
}

/// @nodoc
class _$VoteModelTearOff {
  const _$VoteModelTearOff();

// ignore: unused_element
  _VoteModel call(
      {@nullable String id,
      @required String userID,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required String questionID,
      @required String answerID,
      @required int createdDate,
      @required Education education}) {
    return _VoteModel(
      id: id,
      userID: userID,
      age: age,
      gender: gender,
      city: city,
      questionID: questionID,
      answerID: answerID,
      createdDate: createdDate,
      education: education,
    );
  }

// ignore: unused_element
  VoteModel fromJson(Map<String, Object> json) {
    return VoteModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $VoteModel = _$VoteModelTearOff();

/// @nodoc
mixin _$VoteModel {
  @nullable
  String get id;
  String get userID;
  int get age;
  Gender get gender;
  CityModel get city;
  String get questionID;
  String get answerID;
  int get createdDate;
  Education get education;

  Map<String, dynamic> toJson();
  $VoteModelCopyWith<VoteModel> get copyWith;
}

/// @nodoc
abstract class $VoteModelCopyWith<$Res> {
  factory $VoteModelCopyWith(VoteModel value, $Res Function(VoteModel) then) =
      _$VoteModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      String userID,
      int age,
      Gender gender,
      CityModel city,
      String questionID,
      String answerID,
      int createdDate,
      Education education});

  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class _$VoteModelCopyWithImpl<$Res> implements $VoteModelCopyWith<$Res> {
  _$VoteModelCopyWithImpl(this._value, this._then);

  final VoteModel _value;
  // ignore: unused_field
  final $Res Function(VoteModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object age = freezed,
    Object gender = freezed,
    Object city = freezed,
    Object questionID = freezed,
    Object answerID = freezed,
    Object createdDate = freezed,
    Object education = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      age: age == freezed ? _value.age : age as int,
      gender: gender == freezed ? _value.gender : gender as Gender,
      city: city == freezed ? _value.city : city as CityModel,
      questionID:
          questionID == freezed ? _value.questionID : questionID as String,
      answerID: answerID == freezed ? _value.answerID : answerID as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as int,
      education:
          education == freezed ? _value.education : education as Education,
    ));
  }

  @override
  $CityModelCopyWith<$Res> get city {
    if (_value.city == null) {
      return null;
    }
    return $CityModelCopyWith<$Res>(_value.city, (value) {
      return _then(_value.copyWith(city: value));
    });
  }
}

/// @nodoc
abstract class _$VoteModelCopyWith<$Res> implements $VoteModelCopyWith<$Res> {
  factory _$VoteModelCopyWith(
          _VoteModel value, $Res Function(_VoteModel) then) =
      __$VoteModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      String userID,
      int age,
      Gender gender,
      CityModel city,
      String questionID,
      String answerID,
      int createdDate,
      Education education});

  @override
  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class __$VoteModelCopyWithImpl<$Res> extends _$VoteModelCopyWithImpl<$Res>
    implements _$VoteModelCopyWith<$Res> {
  __$VoteModelCopyWithImpl(_VoteModel _value, $Res Function(_VoteModel) _then)
      : super(_value, (v) => _then(v as _VoteModel));

  @override
  _VoteModel get _value => super._value as _VoteModel;

  @override
  $Res call({
    Object id = freezed,
    Object userID = freezed,
    Object age = freezed,
    Object gender = freezed,
    Object city = freezed,
    Object questionID = freezed,
    Object answerID = freezed,
    Object createdDate = freezed,
    Object education = freezed,
  }) {
    return _then(_VoteModel(
      id: id == freezed ? _value.id : id as String,
      userID: userID == freezed ? _value.userID : userID as String,
      age: age == freezed ? _value.age : age as int,
      gender: gender == freezed ? _value.gender : gender as Gender,
      city: city == freezed ? _value.city : city as CityModel,
      questionID:
          questionID == freezed ? _value.questionID : questionID as String,
      answerID: answerID == freezed ? _value.answerID : answerID as String,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as int,
      education:
          education == freezed ? _value.education : education as Education,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_VoteModel implements _VoteModel {
  const _$_VoteModel(
      {@nullable this.id,
      @required this.userID,
      @required this.age,
      @required this.gender,
      @required this.city,
      @required this.questionID,
      @required this.answerID,
      @required this.createdDate,
      @required this.education})
      : assert(userID != null),
        assert(age != null),
        assert(gender != null),
        assert(city != null),
        assert(questionID != null),
        assert(answerID != null),
        assert(createdDate != null),
        assert(education != null);

  factory _$_VoteModel.fromJson(Map<String, dynamic> json) =>
      _$_$_VoteModelFromJson(json);

  @override
  @nullable
  final String id;
  @override
  final String userID;
  @override
  final int age;
  @override
  final Gender gender;
  @override
  final CityModel city;
  @override
  final String questionID;
  @override
  final String answerID;
  @override
  final int createdDate;
  @override
  final Education education;

  @override
  String toString() {
    return 'VoteModel(id: $id, userID: $userID, age: $age, gender: $gender, city: $city, questionID: $questionID, answerID: $answerID, createdDate: $createdDate, education: $education)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _VoteModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.questionID, questionID) ||
                const DeepCollectionEquality()
                    .equals(other.questionID, questionID)) &&
            (identical(other.answerID, answerID) ||
                const DeepCollectionEquality()
                    .equals(other.answerID, answerID)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.education, education) ||
                const DeepCollectionEquality()
                    .equals(other.education, education)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(userID) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(questionID) ^
      const DeepCollectionEquality().hash(answerID) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(education);

  @override
  _$VoteModelCopyWith<_VoteModel> get copyWith =>
      __$VoteModelCopyWithImpl<_VoteModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_VoteModelToJson(this);
  }
}

abstract class _VoteModel implements VoteModel {
  const factory _VoteModel(
      {@nullable String id,
      @required String userID,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required String questionID,
      @required String answerID,
      @required int createdDate,
      @required Education education}) = _$_VoteModel;

  factory _VoteModel.fromJson(Map<String, dynamic> json) =
      _$_VoteModel.fromJson;

  @override
  @nullable
  String get id;
  @override
  String get userID;
  @override
  int get age;
  @override
  Gender get gender;
  @override
  CityModel get city;
  @override
  String get questionID;
  @override
  String get answerID;
  @override
  int get createdDate;
  @override
  Education get education;
  @override
  _$VoteModelCopyWith<_VoteModel> get copyWith;
}
