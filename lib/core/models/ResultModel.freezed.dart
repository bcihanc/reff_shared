// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ResultModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ResultModel _$ResultModelFromJson(Map<String, dynamic> json) {
  return _ResultModel.fromJson(json);
}

/// @nodoc
class _$ResultModelTearOff {
  const _$ResultModelTearOff();

// ignore: unused_element
  _ResultModel call(
      {@nullable String id,
      @required String questionID,
      @required List<String> answers,
      @required Map<String, Map<int, int>> agesMap,
      @required Map<String, Map<Gender, int>> gendersMap,
      @required Map<String, Map<String, int>> cityNameMap,
      @required Map<String, Map<Education, int>> educationMap}) {
    return _ResultModel(
      id: id,
      questionID: questionID,
      answers: answers,
      agesMap: agesMap,
      gendersMap: gendersMap,
      cityNameMap: cityNameMap,
      educationMap: educationMap,
    );
  }

// ignore: unused_element
  ResultModel fromJson(Map<String, Object> json) {
    return ResultModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ResultModel = _$ResultModelTearOff();

/// @nodoc
mixin _$ResultModel {
  @nullable
  String get id;
  String get questionID;
  List<String> get answers;
  Map<String, Map<int, int>> get agesMap;
  Map<String, Map<Gender, int>> get gendersMap;
  Map<String, Map<String, int>> get cityNameMap;
  Map<String, Map<Education, int>> get educationMap;

  Map<String, dynamic> toJson();
  $ResultModelCopyWith<ResultModel> get copyWith;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      String questionID,
      List<String> answers,
      Map<String, Map<int, int>> agesMap,
      Map<String, Map<Gender, int>> gendersMap,
      Map<String, Map<String, int>> cityNameMap,
      Map<String, Map<Education, int>> educationMap});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res> implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  final ResultModel _value;
  // ignore: unused_field
  final $Res Function(ResultModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object questionID = freezed,
    Object answers = freezed,
    Object agesMap = freezed,
    Object gendersMap = freezed,
    Object cityNameMap = freezed,
    Object educationMap = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      questionID:
          questionID == freezed ? _value.questionID : questionID as String,
      answers: answers == freezed ? _value.answers : answers as List<String>,
      agesMap: agesMap == freezed
          ? _value.agesMap
          : agesMap as Map<String, Map<int, int>>,
      gendersMap: gendersMap == freezed
          ? _value.gendersMap
          : gendersMap as Map<String, Map<Gender, int>>,
      cityNameMap: cityNameMap == freezed
          ? _value.cityNameMap
          : cityNameMap as Map<String, Map<String, int>>,
      educationMap: educationMap == freezed
          ? _value.educationMap
          : educationMap as Map<String, Map<Education, int>>,
    ));
  }
}

/// @nodoc
abstract class _$ResultModelCopyWith<$Res>
    implements $ResultModelCopyWith<$Res> {
  factory _$ResultModelCopyWith(
          _ResultModel value, $Res Function(_ResultModel) then) =
      __$ResultModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      String questionID,
      List<String> answers,
      Map<String, Map<int, int>> agesMap,
      Map<String, Map<Gender, int>> gendersMap,
      Map<String, Map<String, int>> cityNameMap,
      Map<String, Map<Education, int>> educationMap});
}

/// @nodoc
class __$ResultModelCopyWithImpl<$Res> extends _$ResultModelCopyWithImpl<$Res>
    implements _$ResultModelCopyWith<$Res> {
  __$ResultModelCopyWithImpl(
      _ResultModel _value, $Res Function(_ResultModel) _then)
      : super(_value, (v) => _then(v as _ResultModel));

  @override
  _ResultModel get _value => super._value as _ResultModel;

  @override
  $Res call({
    Object id = freezed,
    Object questionID = freezed,
    Object answers = freezed,
    Object agesMap = freezed,
    Object gendersMap = freezed,
    Object cityNameMap = freezed,
    Object educationMap = freezed,
  }) {
    return _then(_ResultModel(
      id: id == freezed ? _value.id : id as String,
      questionID:
          questionID == freezed ? _value.questionID : questionID as String,
      answers: answers == freezed ? _value.answers : answers as List<String>,
      agesMap: agesMap == freezed
          ? _value.agesMap
          : agesMap as Map<String, Map<int, int>>,
      gendersMap: gendersMap == freezed
          ? _value.gendersMap
          : gendersMap as Map<String, Map<Gender, int>>,
      cityNameMap: cityNameMap == freezed
          ? _value.cityNameMap
          : cityNameMap as Map<String, Map<String, int>>,
      educationMap: educationMap == freezed
          ? _value.educationMap
          : educationMap as Map<String, Map<Education, int>>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ResultModel with DiagnosticableTreeMixin implements _ResultModel {
  const _$_ResultModel(
      {@nullable this.id,
      @required this.questionID,
      @required this.answers,
      @required this.agesMap,
      @required this.gendersMap,
      @required this.cityNameMap,
      @required this.educationMap})
      : assert(questionID != null),
        assert(answers != null),
        assert(agesMap != null),
        assert(gendersMap != null),
        assert(cityNameMap != null),
        assert(educationMap != null);

  factory _$_ResultModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ResultModelFromJson(json);

  @override
  @nullable
  final String id;
  @override
  final String questionID;
  @override
  final List<String> answers;
  @override
  final Map<String, Map<int, int>> agesMap;
  @override
  final Map<String, Map<Gender, int>> gendersMap;
  @override
  final Map<String, Map<String, int>> cityNameMap;
  @override
  final Map<String, Map<Education, int>> educationMap;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ResultModel(id: $id, questionID: $questionID, answers: $answers, agesMap: $agesMap, gendersMap: $gendersMap, cityNameMap: $cityNameMap, educationMap: $educationMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ResultModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('questionID', questionID))
      ..add(DiagnosticsProperty('answers', answers))
      ..add(DiagnosticsProperty('agesMap', agesMap))
      ..add(DiagnosticsProperty('gendersMap', gendersMap))
      ..add(DiagnosticsProperty('cityNameMap', cityNameMap))
      ..add(DiagnosticsProperty('educationMap', educationMap));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ResultModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.questionID, questionID) ||
                const DeepCollectionEquality()
                    .equals(other.questionID, questionID)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.agesMap, agesMap) ||
                const DeepCollectionEquality()
                    .equals(other.agesMap, agesMap)) &&
            (identical(other.gendersMap, gendersMap) ||
                const DeepCollectionEquality()
                    .equals(other.gendersMap, gendersMap)) &&
            (identical(other.cityNameMap, cityNameMap) ||
                const DeepCollectionEquality()
                    .equals(other.cityNameMap, cityNameMap)) &&
            (identical(other.educationMap, educationMap) ||
                const DeepCollectionEquality()
                    .equals(other.educationMap, educationMap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(questionID) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(agesMap) ^
      const DeepCollectionEquality().hash(gendersMap) ^
      const DeepCollectionEquality().hash(cityNameMap) ^
      const DeepCollectionEquality().hash(educationMap);

  @override
  _$ResultModelCopyWith<_ResultModel> get copyWith =>
      __$ResultModelCopyWithImpl<_ResultModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ResultModelToJson(this);
  }
}

abstract class _ResultModel implements ResultModel {
  const factory _ResultModel(
          {@nullable String id,
          @required String questionID,
          @required List<String> answers,
          @required Map<String, Map<int, int>> agesMap,
          @required Map<String, Map<Gender, int>> gendersMap,
          @required Map<String, Map<String, int>> cityNameMap,
          @required Map<String, Map<Education, int>> educationMap}) =
      _$_ResultModel;

  factory _ResultModel.fromJson(Map<String, dynamic> json) =
      _$_ResultModel.fromJson;

  @override
  @nullable
  String get id;
  @override
  String get questionID;
  @override
  List<String> get answers;
  @override
  Map<String, Map<int, int>> get agesMap;
  @override
  Map<String, Map<Gender, int>> get gendersMap;
  @override
  Map<String, Map<String, int>> get cityNameMap;
  @override
  Map<String, Map<Education, int>> get educationMap;
  @override
  _$ResultModelCopyWith<_ResultModel> get copyWith;
}
