import 'package:flutter/material.dart';
import 'package:urancodetest/globals.dart';
import 'package:urancodetest/resources/resources.dart';

void reinitDimensionConfig(BuildContext context) {
  // to run dimension config again after the app starts
  dimension.init(context);
}

ThemeData theme(BuildContext context) {
  dimension.init(context); // initialize dimension config...
  return ThemeData(
    appBarTheme: appBarTheme(),
    primarySwatch: Colors.blue,
    splashColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: primaryColor,
    fontFamily: "Inter",
    backgroundColor: Colors.white,
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    disabledColor: Colors.grey,
    hintColor: Colors.black,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
    ),
    indicatorColor: primaryColor,
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
      color: textColor,
      fontFamily: "Inter",
      fontSize: dimension.header1FontSize,
      fontWeight: FontWeight.w700,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontFamily: "Inter",
      fontSize: dimension.header2FontSize,
      fontWeight: FontWeight.w500,
    ),
    bodyText1: TextStyle(
      color: textColor,
      fontFamily: "Inter",
      fontSize: dimension.textFontSize,
      fontWeight: FontWeight.w400,
    ),
    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: dimension.header1FontSize,
      fontWeight: FontWeight.w600,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: primaryColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: primaryColor,
    ),
    titleTextStyle: textTheme().subtitle2,
  );
}
