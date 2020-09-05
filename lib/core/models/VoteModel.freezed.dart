// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'VoteModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
VoteModel _$VoteModelFromJson(Map<String, dynamic> json) {
  return _AnswerModel.fromJson(json);
}

class _$VoteModelTearOff {
  const _$VoteModelTearOff();

// ignore: unused_element
  _AnswerModel call(
      {@nullable String id,
      @required String userID,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required String questionID,
      @required String answerID,
      @required int createdDate}) {
    return _AnswerModel(
      id: id,
      userID: userID,
      age: age,
      gender: gender,
      city: city,
      questionID: questionID,
      answerID: answerID,
      createdDate: createdDate,
    );
  }
}

// ignore: unused_element
const $VoteModel = _$VoteModelTearOff();

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

  Map<String, dynamic> toJson();
  $VoteModelCopyWith<VoteModel> get copyWith;
}

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
      int createdDate});

  $CityModelCopyWith<$Res> get city;
}

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

abstract class _$AnswerModelCopyWith<$Res> implements $VoteModelCopyWith<$Res> {
  factory _$AnswerModelCopyWith(
          _AnswerModel value, $Res Function(_AnswerModel) then) =
      __$AnswerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      String userID,
      int age,
      Gender gender,
      CityModel city,
      String questionID,
      String answerID,
      int createdDate});

  @override
  $CityModelCopyWith<$Res> get city;
}

class __$AnswerModelCopyWithImpl<$Res> extends _$VoteModelCopyWithImpl<$Res>
    implements _$AnswerModelCopyWith<$Res> {
  __$AnswerModelCopyWithImpl(
      _AnswerModel _value, $Res Function(_AnswerModel) _then)
      : super(_value, (v) => _then(v as _AnswerModel));

  @override
  _AnswerModel get _value => super._value as _AnswerModel;

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
  }) {
    return _then(_AnswerModel(
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
    ));
  }
}

@JsonSerializable()
class _$_AnswerModel implements _AnswerModel {
  const _$_AnswerModel(
      {@nullable this.id,
      @required this.userID,
      @required this.age,
      @required this.gender,
      @required this.city,
      @required this.questionID,
      @required this.answerID,
      @required this.createdDate})
      : assert(userID != null),
        assert(age != null),
        assert(gender != null),
        assert(city != null),
        assert(questionID != null),
        assert(answerID != null),
        assert(createdDate != null);

  factory _$_AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$_$_AnswerModelFromJson(json);

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
  String toString() {
    return 'VoteModel(id: $id, userID: $userID, age: $age, gender: $gender, city: $city, questionID: $questionID, answerID: $answerID, createdDate: $createdDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnswerModel &&
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
                    .equals(other.createdDate, createdDate)));
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
      const DeepCollectionEquality().hash(createdDate);

  @override
  _$AnswerModelCopyWith<_AnswerModel> get copyWith =>
      __$AnswerModelCopyWithImpl<_AnswerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AnswerModelToJson(this);
  }
}

abstract class _AnswerModel implements VoteModel {
  const factory _AnswerModel(
      {@nullable String id,
      @required String userID,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required String questionID,
      @required String answerID,
      @required int createdDate}) = _$_AnswerModel;

  factory _AnswerModel.fromJson(Map<String, dynamic> json) =
      _$_AnswerModel.fromJson;

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
  _$AnswerModelCopyWith<_AnswerModel> get copyWith;
}
