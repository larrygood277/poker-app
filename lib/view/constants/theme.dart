import 'package:flutter/material.dart';
import 'package:pokergame/view/constants/size.dart';

import 'color.dart';

class AppTheme {
  ThemeData get theme => ThemeData(
        fontFamily: 'OswaldSemiBold',
        backgroundColor: ColorConstants.instance.backgroudColor,
        primaryColor: ColorConstants.instance.primaryColor,
        accentColor: ColorConstants.instance.accentColor,
        focusColor: ColorConstants.instance.focusColor,
        hintColor: ColorConstants.instance.hintColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorConstants.instance.backgroudColor,
          elevation: 2,
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.normal,
        ),
        dividerTheme: DividerThemeData(
          space: 1,
          thickness: 2,
          color: ColorConstants.instance.dividerColor,
        ),
        iconTheme: IconThemeData(
          opacity: 1,
          size: Sizes.iconSizeMid,
          color: ColorConstants.instance.button,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.instance.black,
          ),
          //ButtonTextStyle
          headline2: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: ColorConstants.instance.white,
          ),
          headline3: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: ColorConstants.instance.white,
          ),
          headline4: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w700,
            color: ColorConstants.instance.black,
          ),
          subtitle1: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w700,
            color: ColorConstants.instance.textSubtitle,
          ),
          subtitle2: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.instance.white,
          ),
        ),
      );
}
