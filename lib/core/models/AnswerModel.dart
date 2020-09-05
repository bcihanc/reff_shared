import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AnswerModel.freezed.dart';
part 'AnswerModel.g.dart';

@freezed
abstract class AnswerModel with _$AnswerModel {
  const factory AnswerModel(
      {@nullable String id,
      @required String content,
      @nullable String imageUrl,
      @Default(MyColor.TRANSPARENT) MyColor color}) = _AnswerModel;

  factory AnswerModel.fromJson(Map<String, dynamic> json) =>
      _$AnswerModelFromJson(json);
}

enum MyColor {
  AMBER,
  BLACK,
  BLUE,
  BLUE_GREY,
  BROWN,
  CYAN,
  DEEP_ORANGE,
  DEEP_PURPLE,
  GREEN,
  GREY,
  INDIGO,
  LIGHT_BLUE,
  LIGHT_GREEN,
  LIME,
  ORANGE,
  PINK,
  PURPLE,
  RED,
  TEAL,
  TRANSPARENT,
  WHITE,
  YELLOW,
}

extension MyColorExtension on MyColor {
  Color toColor() {
    switch (this) {
      case MyColor.AMBER:
        return Colors.amber;

      case MyColor.BLACK:
        return Colors.black;

      case MyColor.BLUE:
        return Colors.blue;

      case MyColor.BLUE_GREY:
        return Colors.blueGrey;

      case MyColor.BROWN:
        return Colors.brown;

      case MyColor.CYAN:
        return Colors.cyan;

      case MyColor.DEEP_ORANGE:
        return Colors.deepOrange;

      case MyColor.DEEP_PURPLE:
        return Colors.deepPurple;

      case MyColor.GREEN:
        return Colors.green;

      case MyColor.GREY:
        return Colors.grey;

      case MyColor.INDIGO:
        return Colors.indigo;

      case MyColor.LIGHT_BLUE:
        return Colors.lightBlue;

      case MyColor.LIGHT_GREEN:
        return Colors.lightGreen;

      case MyColor.LIME:
        return Colors.lime;

      case MyColor.ORANGE:
        return Colors.orange;

      case MyColor.PINK:
        return Colors.pink;

      case MyColor.PURPLE:
        return Colors.purple;

      case MyColor.RED:
        return Colors.red;

      case MyColor.TEAL:
        return Colors.teal;

      case MyColor.TRANSPARENT:
        return Colors.transparent;

      case MyColor.WHITE:
        return Colors.white;

      case MyColor.YELLOW:
        return Colors.yellow;

      default:
        return Colors.transparent;
    }
  }
}

extension MaterialColorExtensions on Color {
  MyColor myColor() {
    if (this == Colors.amber)
      return MyColor.AMBER;
    else if (this == Colors.black)
      return MyColor.BLACK;
    else if (this == Colors.blue)
      return MyColor.BLUE;
    else if (this == Colors.blueGrey)
      return MyColor.BLUE_GREY;
    else if (this == Colors.brown)
      return MyColor.BROWN;
    else if (this == Colors.cyan)
      return MyColor.CYAN;
    else if (this == Colors.deepOrange)
      return MyColor.DEEP_ORANGE;
    else if (this == Colors.deepPurple)
      return MyColor.DEEP_PURPLE;
    else if (this == Colors.green)
      return MyColor.GREEN;
    else if (this == Colors.grey)
      return MyColor.GREY;
    else if (this == Colors.indigo)
      return MyColor.INDIGO;
    else if (this == Colors.lightBlue)
      return MyColor.LIGHT_BLUE;
    else if (this == Colors.lightGreen)
      return MyColor.LIGHT_GREEN;
    else if (this == Colors.lime)
      return MyColor.LIME;
    else if (this == Colors.orange)
      return MyColor.ORANGE;
    else if (this == Colors.pink)
      return MyColor.PINK;
    else if (this == Colors.purple)
      return MyColor.PURPLE;
    else if (this == Colors.teal)
      return MyColor.TEAL;
    else if (this == Colors.transparent)
      return MyColor.TRANSPARENT;
    else if (this == Colors.white)
      return MyColor.WHITE;
    else if (this == Colors.yellow)
      return MyColor.YELLOW;
    else
      return MyColor.TRANSPARENT;
  }
}
