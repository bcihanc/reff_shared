// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'UserModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

class _$UserModelTearOff {
  const _$UserModelTearOff();

// ignore: unused_element
  _UserModel call(
      {@nullable String id,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required int createdDate,
      int point = 0}) {
    return _UserModel(
      id: id,
      age: age,
      gender: gender,
      city: city,
      createdDate: createdDate,
      point: point,
    );
  }
}

// ignore: unused_element
const $UserModel = _$UserModelTearOff();

mixin _$UserModel {
  @nullable
  String get id;
  int get age;
  Gender get gender;
  CityModel get city;
  int get createdDate;
  int get point;

  Map<String, dynamic> toJson();
  $UserModelCopyWith<UserModel> get copyWith;
}

abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      int age,
      Gender gender,
      CityModel city,
      int createdDate,
      int point});

  $CityModelCopyWith<$Res> get city;
}

class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  final UserModel _value;
  // ignore: unused_field
  final $Res Function(UserModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object age = freezed,
    Object gender = freezed,
    Object city = freezed,
    Object createdDate = freezed,
    Object point = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      age: age == freezed ? _value.age : age as int,
      gender: gender == freezed ? _value.gender : gender as Gender,
      city: city == freezed ? _value.city : city as CityModel,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as int,
      point: point == freezed ? _value.point : point as int,
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

abstract class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) then) =
      __$UserModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      int age,
      Gender gender,
      CityModel city,
      int createdDate,
      int point});

  @override
  $CityModelCopyWith<$Res> get city;
}

class __$UserModelCopyWithImpl<$Res> extends _$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(_UserModel _value, $Res Function(_UserModel) _then)
      : super(_value, (v) => _then(v as _UserModel));

  @override
  _UserModel get _value => super._value as _UserModel;

  @override
  $Res call({
    Object id = freezed,
    Object age = freezed,
    Object gender = freezed,
    Object city = freezed,
    Object createdDate = freezed,
    Object point = freezed,
  }) {
    return _then(_UserModel(
      id: id == freezed ? _value.id : id as String,
      age: age == freezed ? _value.age : age as int,
      gender: gender == freezed ? _value.gender : gender as Gender,
      city: city == freezed ? _value.city : city as CityModel,
      createdDate:
          createdDate == freezed ? _value.createdDate : createdDate as int,
      point: point == freezed ? _value.point : point as int,
    ));
  }
}

@JsonSerializable()
class _$_UserModel extends _UserModel {
  const _$_UserModel(
      {@nullable this.id,
      @required this.age,
      @required this.gender,
      @required this.city,
      @required this.createdDate,
      this.point = 0})
      : assert(age != null),
        assert(gender != null),
        assert(city != null),
        assert(createdDate != null),
        assert(point != null),
        super._();

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$_$_UserModelFromJson(json);

  @override
  @nullable
  final String id;
  @override
  final int age;
  @override
  final Gender gender;
  @override
  final CityModel city;
  @override
  final int createdDate;
  @JsonKey(defaultValue: 0)
  @override
  final int point;

  @override
  String toString() {
    return 'UserModel(id: $id, age: $age, gender: $gender, city: $city, createdDate: $createdDate, point: $point)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UserModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.age, age) ||
                const DeepCollectionEquality().equals(other.age, age)) &&
            (identical(other.gender, gender) ||
                const DeepCollectionEquality().equals(other.gender, gender)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.createdDate, createdDate) ||
                const DeepCollectionEquality()
                    .equals(other.createdDate, createdDate)) &&
            (identical(other.point, point) ||
                const DeepCollectionEquality().equals(other.point, point)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(age) ^
      const DeepCollectionEquality().hash(gender) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(createdDate) ^
      const DeepCollectionEquality().hash(point);

  @override
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserModelToJson(this);
  }
}

abstract class _UserModel extends UserModel {
  const _UserModel._() : super._();
  const factory _UserModel(
      {@nullable String id,
      @required int age,
      @required Gender gender,
      @required CityModel city,
      @required int createdDate,
      int point}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @nullable
  String get id;
  @override
  int get age;
  @override
  Gender get gender;
  @override
  CityModel get city;
  @override
  int get createdDate;
  @override
  int get point;
  @override
  _$UserModelCopyWith<_UserModel> get copyWith;
}
