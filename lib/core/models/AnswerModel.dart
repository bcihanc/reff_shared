import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AnswerModel.freezed.dart';
part "AnswerModel.g.dart";

@freezed
abstract class AnswerModel with _$AnswerModel {
  const factory AnswerModel(
      {@nullable String id,
      @required String content,
      @nullable String imageUrl,
      @Default(MyColor.transparent) MyColor color}) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}

enum MyColor {
  amber,
  black,
  blue,
  blueGrey,
  brown,
  cyan,
  deepOrange,
  deepPurple,
  green,
  grey,
  indigo,
  lightBlue,
  lightGreen,
  lime,
  orange,
  pink,
  purple,
  red,
  teal,
  transparent,
  white,
  yellow,
}

extension MyColorExtension on MyColor {
  Color toColor() {
    print("");
    switch (this) {
      case MyColor.amber:
        return Colors.amber;

      case MyColor.black:
        return Colors.black;

      case MyColor.blue:
        return Colors.blue;

      case MyColor.blueGrey:
        return Colors.blueGrey;

      case MyColor.brown:
        return Colors.brown;

      case MyColor.cyan:
        return Colors.cyan;

      case MyColor.deepOrange:
        return Colors.deepOrange;

      case MyColor.deepPurple:
        return Colors.deepPurple;

      case MyColor.green:
        return Colors.green;

      case MyColor.grey:
        return Colors.grey;

      case MyColor.indigo:
        return Colors.indigo;

      case MyColor.lightBlue:
        return Colors.lightBlue;

      case MyColor.lightGreen:
        return Colors.lightGreen;

      case MyColor.lime:
        return Colors.lime;

      case MyColor.orange:
        return Colors.orange;

      case MyColor.pink:
        return Colors.pink;

      case MyColor.purple:
        return Colors.purple;

      case MyColor.red:
        return Colors.red;

      case MyColor.teal:
        return Colors.teal;

      case MyColor.transparent:
        return Colors.transparent;

      case MyColor.white:
        return Colors.white;

      case MyColor.yellow:
        return Colors.yellow;

      default:
        return Colors.transparent;
    }
  }
}

extension ColorExtensions on Color {
  MyColor myColor() {
    if (this == Colors.amber) {
      return MyColor.amber;
    } else if (this == Colors.black) {
      return MyColor.black;
    } else if (this == Colors.blue) {
      return MyColor.blue;
    } else if (this == Colors.blueGrey) {
      return MyColor.blueGrey;
    } else if (this == Colors.brown) {
      return MyColor.brown;
    } else if (this == Colors.cyan) {
      return MyColor.cyan;
    } else if (this == Colors.deepOrange) {
      return MyColor.deepOrange;
    } else if (this == Colors.deepPurple) {
      return MyColor.deepPurple;
    } else if (this == Colors.green) {
      return MyColor.green;
    } else if (this == Colors.grey) {
      return MyColor.grey;
    } else if (this == Colors.indigo) {
      return MyColor.indigo;
    } else if (this == Colors.lightBlue) {
      return MyColor.lightBlue;
    } else if (this == Colors.lightGreen) {
      return MyColor.lightGreen;
    } else if (this == Colors.lime) {
      return MyColor.lime;
    } else if (this == Colors.orange) {
      return MyColor.orange;
    } else if (this == Colors.pink) {
      return MyColor.pink;
    } else if (this == Colors.purple) {
      return MyColor.purple;
    } else if (this == Colors.red) {
      return MyColor.red;
    } else if (this == Colors.teal) {
      return MyColor.teal;
    } else if (this == Colors.transparent) {
      return MyColor.transparent;
    } else if (this == Colors.white) {
      return MyColor.white;
    } else if (this == Colors.yellow) {
      return MyColor.yellow;
    } else {
      return MyColor.transparent;
    }
  }
}
