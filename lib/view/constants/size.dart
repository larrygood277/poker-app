import 'package:flutter/material.dart';

class Sizes {
  //numbers-sizes
  static double sizedBox = 10;
  static double sizedBoxMax = 20;
  static double sizedBoxMin = 5;
  static double iconSizeMin = 15;
  static double iconSizeMid = 20;
  static double iconSizeMax = 25;
  static double fontSizeMax = 20;
  static double fontSizeMid = 16;
  static double fontSize = 12;
  static double fontSizeMin = 10;
}
class PaddingConstants {
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();

  final allPadding = EdgeInsets.all(10);
  final allMaxPadding = EdgeInsets.all(30);
  final allMinPadding = EdgeInsets.all(5);
  final onlyTop = EdgeInsets.only(top: 10);
  final onlyLeft = EdgeInsets.only(left: 10);
  final onlyRight = EdgeInsets.only(right: 10);
  final onlyBottom = EdgeInsets.only(bottom: 10);
  final onlyTopMin = EdgeInsets.only(top: 5);
  final onlyLeftMin = EdgeInsets.only(left: 5);
  final onlyRightMin = EdgeInsets.only(right: 5);
  final onlyBottomMin = EdgeInsets.only(bottom: 5);
  final symmetricShort = EdgeInsets.symmetric(horizontal: 20.0);
  final paddingVerHor = EdgeInsets.symmetric(vertical:10, horizontal: 10);
}
