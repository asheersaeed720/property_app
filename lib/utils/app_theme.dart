import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const primary = Color(0xFF99a4f3);
  static const mainColor = Color(0xFF000000);
  static const secondary = Color(0xFFe54140);
  static const appBgColor = Color(0xFFFAFAFA);
  static const shadowColor = Colors.black87;
  static const Color nearBlack = Color(0xFF213333);

  static const String fontName = 'Poppins';

  static const TextTheme textTheme = TextTheme(
    headline1: headTxt1,
    headline2: headTxt2,
    bodyText1: bodyTxt1,
    subtitle1: subtitleTxt1,
  );

  static const TextStyle headTxt1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 22.0,
    color: nearBlack,
  );
  static const TextStyle headTxt2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: nearBlack,
  );

  static const TextStyle bodyTxt1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: nearBlack,
  );
  static const TextStyle subtitleTxt1 = TextStyle(
    fontFamily: fontName,
    fontSize: 13.5,
    color: Colors.black87,
  );
}
