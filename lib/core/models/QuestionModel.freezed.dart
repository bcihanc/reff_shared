// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'QuestionModel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
QuestionModel _$QuestionModelFromJson(Map<String, dynamic> json) {
  return _QuestionModel.fromJson(json);
}

/// @nodoc
class _$QuestionModelTearOff {
  const _$QuestionModelTearOff();

// ignore: unused_element
  _QuestionModel call(
      {@nullable String id,
      @required String header,
      @nullable String content,
      @nullable List<String> answers,
      @nullable String imageUrl,
      @required int startDate,
      @required int endDate,
      @required CityModel city,
      int likes = 0,
      int disLikes = 0,
      bool isActive = false}) {
    return _QuestionModel(
      id: id,
      header: header,
      content: content,
      answers: answers,
      imageUrl: imageUrl,
      startDate: startDate,
      endDate: endDate,
      city: city,
      likes: likes,
      disLikes: disLikes,
      isActive: isActive,
    );
  }

// ignore: unused_element
  QuestionModel fromJson(Map<String, Object> json) {
    return QuestionModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $QuestionModel = _$QuestionModelTearOff();

/// @nodoc
mixin _$QuestionModel {
  @nullable
  String get id;
  String get header;
  @nullable
  String get content;
  @nullable
  List<String> get answers;
  @nullable
  String get imageUrl;
  int get startDate;
  int get endDate;
  CityModel get city;
  int get likes;
  int get disLikes;
  bool get isActive;

  Map<String, dynamic> toJson();
  $QuestionModelCopyWith<QuestionModel> get copyWith;
}

/// @nodoc
abstract class $QuestionModelCopyWith<$Res> {
  factory $QuestionModelCopyWith(
          QuestionModel value, $Res Function(QuestionModel) then) =
      _$QuestionModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      String header,
      @nullable String content,
      @nullable List<String> answers,
      @nullable String imageUrl,
      int startDate,
      int endDate,
      CityModel city,
      int likes,
      int disLikes,
      bool isActive});

  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._value, this._then);

  final QuestionModel _value;
  // ignore: unused_field
  final $Res Function(QuestionModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object header = freezed,
    Object content = freezed,
    Object answers = freezed,
    Object imageUrl = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object city = freezed,
    Object likes = freezed,
    Object disLikes = freezed,
    Object isActive = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      header: header == freezed ? _value.header : header as String,
      content: content == freezed ? _value.content : content as String,
      answers: answers == freezed ? _value.answers : answers as List<String>,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      startDate: startDate == freezed ? _value.startDate : startDate as int,
      endDate: endDate == freezed ? _value.endDate : endDate as int,
      city: city == freezed ? _value.city : city as CityModel,
      likes: likes == freezed ? _value.likes : likes as int,
      disLikes: disLikes == freezed ? _value.disLikes : disLikes as int,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
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
abstract class _$QuestionModelCopyWith<$Res>
    implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(
          _QuestionModel value, $Res Function(_QuestionModel) then) =
      __$QuestionModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      String header,
      @nullable String content,
      @nullable List<String> answers,
      @nullable String imageUrl,
      int startDate,
      int endDate,
      CityModel city,
      int likes,
      int disLikes,
      bool isActive});

  @override
  $CityModelCopyWith<$Res> get city;
}

/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    extends _$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(
      _QuestionModel _value, $Res Function(_QuestionModel) _then)
      : super(_value, (v) => _then(v as _QuestionModel));

  @override
  _QuestionModel get _value => super._value as _QuestionModel;

  @override
  $Res call({
    Object id = freezed,
    Object header = freezed,
    Object content = freezed,
    Object answers = freezed,
    Object imageUrl = freezed,
    Object startDate = freezed,
    Object endDate = freezed,
    Object city = freezed,
    Object likes = freezed,
    Object disLikes = freezed,
    Object isActive = freezed,
  }) {
    return _then(_QuestionModel(
      id: id == freezed ? _value.id : id as String,
      header: header == freezed ? _value.header : header as String,
      content: content == freezed ? _value.content : content as String,
      answers: answers == freezed ? _value.answers : answers as List<String>,
      imageUrl: imageUrl == freezed ? _value.imageUrl : imageUrl as String,
      startDate: startDate == freezed ? _value.startDate : startDate as int,
      endDate: endDate == freezed ? _value.endDate : endDate as int,
      city: city == freezed ? _value.city : city as CityModel,
      likes: likes == freezed ? _value.likes : likes as int,
      disLikes: disLikes == freezed ? _value.disLikes : disLikes as int,
      isActive: isActive == freezed ? _value.isActive : isActive as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_QuestionModel implements _QuestionModel {
  const _$_QuestionModel(
      {@nullable this.id,
      @required this.header,
      @nullable this.content,
      @nullable this.answers,
      @nullable this.imageUrl,
      @required this.startDate,
      @required this.endDate,
      @required this.city,
      this.likes = 0,
      this.disLikes = 0,
      this.isActive = false})
      : assert(header != null),
        assert(startDate != null),
        assert(endDate != null),
        assert(city != null),
        assert(likes != null),
        assert(disLikes != null),
        assert(isActive != null);

  factory _$_QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$_$_QuestionModelFromJson(json);

  @override
  @nullable
  final String id;
  @override
  final String header;
  @override
  @nullable
  final String content;
  @override
  @nullable
  final List<String> answers;
  @override
  @nullable
  final String imageUrl;
  @override
  final int startDate;
  @override
  final int endDate;
  @override
  final CityModel city;
  @JsonKey(defaultValue: 0)
  @override
  final int likes;
  @JsonKey(defaultValue: 0)
  @override
  final int disLikes;
  @JsonKey(defaultValue: false)
  @override
  final bool isActive;

  @override
  String toString() {
    return 'QuestionModel(id: $id, header: $header, content: $content, answers: $answers, imageUrl: $imageUrl, startDate: $startDate, endDate: $endDate, city: $city, likes: $likes, disLikes: $disLikes, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _QuestionModel &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.header, header) ||
                const DeepCollectionEquality().equals(other.header, header)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.answers, answers) ||
                const DeepCollectionEquality()
                    .equals(other.answers, answers)) &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.city, city) ||
                const DeepCollectionEquality().equals(other.city, city)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.disLikes, disLikes) ||
                const DeepCollectionEquality()
                    .equals(other.disLikes, disLikes)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(header) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(answers) ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(startDate) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(city) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(disLikes) ^
      const DeepCollectionEquality().hash(isActive);

  @override
  _$QuestionModelCopyWith<_QuestionModel> get copyWith =>
      __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_QuestionModelToJson(this);
  }
}

abstract class _QuestionModel implements QuestionModel {
  const factory _QuestionModel(
      {@nullable String id,
      @required String header,
      @nullable String content,
      @nullable List<String> answers,
      @nullable String imageUrl,
      @required int startDate,
      @required int endDate,
      @required CityModel city,
      int likes,
      int disLikes,
      bool isActive}) = _$_QuestionModel;

  factory _QuestionModel.fromJson(Map<String, dynamic> json) =
      _$_QuestionModel.fromJson;

  @override
  @nullable
  String get id;
  @override
  String get header;
  @override
  @nullable
  String get content;
  @override
  @nullable
  List<String> get answers;
  @override
  @nullable
  String get imageUrl;
  @override
  int get startDate;
  @override
  int get endDate;
  @override
  CityModel get city;
  @override
  int get likes;
  @override
  int get disLikes;
  @override
  bool get isActive;
  @override
  _$QuestionModelCopyWith<_QuestionModel> get copyWith;
}
