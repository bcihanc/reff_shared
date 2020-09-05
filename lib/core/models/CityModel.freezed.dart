// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'CityModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CityModel _$CityModelFromJson(Map<String, dynamic> json) {
  return _CityModel.fromJson(json);
}

class _$CityModelTearOff {
  const _$CityModelTearOff();

// ignore: unused_element
  _CityModel call(
      {@required String countryCode,
      @required String countryName,
      @required String langCode,
      @required String name,
      @required int utc}) {
    return _CityModel(
      countryCode: countryCode,
      countryName: countryName,
      langCode: langCode,
      name: name,
      utc: utc,
    );
  }
}

// ignore: unused_element
const $CityModel = _$CityModelTearOff();

mixin _$CityModel {
  String get countryCode;
  String get countryName;
  String get langCode;
  String get name;
  int get utc;

  Map<String, dynamic> toJson();
  $CityModelCopyWith<CityModel> get copyWith;
}

abstract class $CityModelCopyWith<$Res> {
  factory $CityModelCopyWith(CityModel value, $Res Function(CityModel) then) =
      _$CityModelCopyWithImpl<$Res>;
  $Res call(
      {String countryCode,
      String countryName,
      String langCode,
      String name,
      int utc});
}

class _$CityModelCopyWithImpl<$Res> implements $CityModelCopyWith<$Res> {
  _$CityModelCopyWithImpl(this._value, this._then);

  final CityModel _value;
  // ignore: unused_field
  final $Res Function(CityModel) _then;

  @override
  $Res call({
    Object countryCode = freezed,
    Object countryName = freezed,
    Object langCode = freezed,
    Object name = freezed,
    Object utc = freezed,
  }) {
    return _then(_value.copyWith(
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      name: name == freezed ? _value.name : name as String,
      utc: utc == freezed ? _value.utc : utc as int,
    ));
  }
}

abstract class _$CityModelCopyWith<$Res> implements $CityModelCopyWith<$Res> {
  factory _$CityModelCopyWith(
          _CityModel value, $Res Function(_CityModel) then) =
      __$CityModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String countryCode,
      String countryName,
      String langCode,
      String name,
      int utc});
}

class __$CityModelCopyWithImpl<$Res> extends _$CityModelCopyWithImpl<$Res>
    implements _$CityModelCopyWith<$Res> {
  __$CityModelCopyWithImpl(_CityModel _value, $Res Function(_CityModel) _then)
      : super(_value, (v) => _then(v as _CityModel));

  @override
  _CityModel get _value => super._value as _CityModel;

  @override
  $Res call({
    Object countryCode = freezed,
    Object countryName = freezed,
    Object langCode = freezed,
    Object name = freezed,
    Object utc = freezed,
  }) {
    return _then(_CityModel(
      countryCode:
          countryCode == freezed ? _value.countryCode : countryCode as String,
      countryName:
          countryName == freezed ? _value.countryName : countryName as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      name: name == freezed ? _value.name : name as String,
      utc: utc == freezed ? _value.utc : utc as int,
    ));
  }
}

@JsonSerializable()
class _$_CityModel implements _CityModel {
  const _$_CityModel(
      {@required this.countryCode,
      @required this.countryName,
      @required this.langCode,
      @required this.name,
      @required this.utc})
      : assert(countryCode != null),
        assert(countryName != null),
        assert(langCode != null),
        assert(name != null),
        assert(utc != null);

  factory _$_CityModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CityModelFromJson(json);

  @override
  final String countryCode;
  @override
  final String countryName;
  @override
  final String langCode;
  @override
  final String name;
  @override
  final int utc;

  @override
  String toString() {
    return 'CityModel(countryCode: $countryCode, countryName: $countryName, langCode: $langCode, name: $name, utc: $utc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CityModel &&
            (identical(other.countryCode, countryCode) ||
                const DeepCollectionEquality()
                    .equals(other.countryCode, countryCode)) &&
            (identical(other.countryName, countryName) ||
                const DeepCollectionEquality()
                    .equals(other.countryName, countryName)) &&
            (identical(other.langCode, langCode) ||
                const DeepCollectionEquality()
                    .equals(other.langCode, langCode)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.utc, utc) ||
                const DeepCollectionEquality().equals(other.utc, utc)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(countryCode) ^
      const DeepCollectionEquality().hash(countryName) ^
      const DeepCollectionEquality().hash(langCode) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(utc);

  @override
  _$CityModelCopyWith<_CityModel> get copyWith =>
      __$CityModelCopyWithImpl<_CityModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CityModelToJson(this);
  }
}

abstract class _CityModel implements CityModel {
  const factory _CityModel(
      {@required String countryCode,
      @required String countryName,
      @required String langCode,
      @required String name,
      @required int utc}) = _$_CityModel;

  factory _CityModel.fromJson(Map<String, dynamic> json) =
      _$_CityModel.fromJson;

  @override
  String get countryCode;
  @override
  String get countryName;
  @override
  String get langCode;
  @override
  String get name;
  @override
  int get utc;
  @override
  _$CityModelCopyWith<_CityModel> get copyWith;
}

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

class _$CountryModelTearOff {
  const _$CountryModelTearOff();

// ignore: unused_element
  _CountryModel call(
      {@required String name,
      @required CityModel capital,
      @required String code,
      @required String langCode,
      @required List<CityModel> cities}) {
    return _CountryModel(
      name: name,
      capital: capital,
      code: code,
      langCode: langCode,
      cities: cities,
    );
  }
}

// ignore: unused_element
const $CountryModel = _$CountryModelTearOff();

mixin _$CountryModel {
  String get name;
  CityModel get capital;
  String get code;
  String get langCode;
  List<CityModel> get cities;

  Map<String, dynamic> toJson();
  $CountryModelCopyWith<CountryModel> get copyWith;
}

abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res>;
  $Res call(
      {String name,
      CityModel capital,
      String code,
      String langCode,
      List<CityModel> cities});

  $CityModelCopyWith<$Res> get capital;
}

class _$CountryModelCopyWithImpl<$Res> implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  final CountryModel _value;
  // ignore: unused_field
  final $Res Function(CountryModel) _then;

  @override
  $Res call({
    Object name = freezed,
    Object capital = freezed,
    Object code = freezed,
    Object langCode = freezed,
    Object cities = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed ? _value.name : name as String,
      capital: capital == freezed ? _value.capital : capital as CityModel,
      code: code == freezed ? _value.code : code as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      cities: cities == freezed ? _value.cities : cities as List<CityModel>,
    ));
  }

  @override
  $CityModelCopyWith<$Res> get capital {
    if (_value.capital == null) {
      return null;
    }
    return $CityModelCopyWith<$Res>(_value.capital, (value) {
      return _then(_value.copyWith(capital: value));
    });
  }
}

abstract class _$CountryModelCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$CountryModelCopyWith(
          _CountryModel value, $Res Function(_CountryModel) then) =
      __$CountryModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      CityModel capital,
      String code,
      String langCode,
      List<CityModel> cities});

  @override
  $CityModelCopyWith<$Res> get capital;
}

class __$CountryModelCopyWithImpl<$Res> extends _$CountryModelCopyWithImpl<$Res>
    implements _$CountryModelCopyWith<$Res> {
  __$CountryModelCopyWithImpl(
      _CountryModel _value, $Res Function(_CountryModel) _then)
      : super(_value, (v) => _then(v as _CountryModel));

  @override
  _CountryModel get _value => super._value as _CountryModel;

  @override
  $Res call({
    Object name = freezed,
    Object capital = freezed,
    Object code = freezed,
    Object langCode = freezed,
    Object cities = freezed,
  }) {
    return _then(_CountryModel(
      name: name == freezed ? _value.name : name as String,
      capital: capital == freezed ? _value.capital : capital as CityModel,
      code: code == freezed ? _value.code : code as String,
      langCode: langCode == freezed ? _value.langCode : langCode as String,
      cities: cities == freezed ? _value.cities : cities as List<CityModel>,
    ));
  }
}

@JsonSerializable()
class _$_CountryModel implements _CountryModel {
  const _$_CountryModel(
      {@required this.name,
      @required this.capital,
      @required this.code,
      @required this.langCode,
      @required this.cities})
      : assert(name != null),
        assert(capital != null),
        assert(code != null),
        assert(langCode != null),
        assert(cities != null);

  factory _$_CountryModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CountryModelFromJson(json);

  @override
  final String name;
  @override
  final CityModel capital;
  @override
  final String code;
  @override
  final String langCode;
  @override
  final List<CityModel> cities;

  @override
  String toString() {
    return 'CountryModel(name: $name, capital: $capital, code: $code, langCode: $langCode, cities: $cities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CountryModel &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.capital, capital) ||
                const DeepCollectionEquality()
                    .equals(other.capital, capital)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.langCode, langCode) ||
                const DeepCollectionEquality()
                    .equals(other.langCode, langCode)) &&
            (identical(other.cities, cities) ||
                const DeepCollectionEquality().equals(other.cities, cities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(capital) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(langCode) ^
      const DeepCollectionEquality().hash(cities);

  @override
  _$CountryModelCopyWith<_CountryModel> get copyWith =>
      __$CountryModelCopyWithImpl<_CountryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CountryModelToJson(this);
  }
}

abstract class _CountryModel implements CountryModel {
  const factory _CountryModel(
      {@required String name,
      @required CityModel capital,
      @required String code,
      @required String langCode,
      @required List<CityModel> cities}) = _$_CountryModel;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$_CountryModel.fromJson;

  @override
  String get name;
  @override
  CityModel get capital;
  @override
  String get code;
  @override
  String get langCode;
  @override
  List<CityModel> get cities;
  @override
  _$CountryModelCopyWith<_CountryModel> get copyWith;
}
