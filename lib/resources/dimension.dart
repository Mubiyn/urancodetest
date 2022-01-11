import 'package:flutter/material.dart';

double smallScreenWidth = 330;
double bigScreenWidth = 350;
double bigScreenHeight = 630;
double smallScreenHeight = 600;
double header1FontSizeBigScreen = 24;
double header1FontSizeMediumScreen = 20;
double header1FontSizeSmallScreen = 16;
double header2FontSizeBigScreen = 20;
double header2FontSizeMediumScreen = 16;
double header2FontSizeSmallScreen = 12;
double paddingBigScreen = 30;
double paddingMediumScreen = 24;
double paddingSmallScreen = 18;
double header3FontSizeBigScreen = 16;
double header3FontSizeMediumScreen = 12;
double header3FontSizeSmallScreen = 9;
double textFontSizeBigScreen = 16;
double textFontSizeMediumScreen = 13;
double textFontSizeSmallScreen = 10;
double smallVerticalPaddingBigScreen = 12;
double smallVerticalPaddingSmallScreen = 8;
double smallVerticalPaddingMediumScreen = 4;
double smallHorizonalPaddingBigScreen = 12;
double smallHorizonalPaddingMediumScreen = 8;
double smallHorizonalPaddingSmallScreen = 4;
double horizontalPaddingBigScreen = 24;
double horizontalPaddingMediumScreen = 18;
double horizontalPaddingSmallScreen = 12;
double verticalPaddingBigScreen = 24;
double verticalPaddingMediumScreen = 18;
double verticalPaddingSmallScreen = 12;
double buttonHeightBigScreen = 50;
double buttonHeightMediumScreen = 45;
double buttonHeightSmallScreen = 38;
double buttonborderRadiusBigScreen = 12;
double buttonborderRadiusMediumScreen = 9;
double buttonborderRadiusSmallScreen = 6;
double textFieldBorderRadiusBigScreen = 20;
double textFieldBorderRadiusSmallScreen = 15;
double textFieldBorderRadiusMediumScreen = 10;

extension DimsExtension on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;
  double deviceWidth([double extent = 1]) => mediaQuerySize.width * extent;
  double deviceHeight([double extent = 1]) => mediaQuerySize.height * extent;
  Orientation get deviceOrientation => MediaQuery.of(this).orientation;
  bool get isLandscape => deviceOrientation == Orientation.landscape;
  bool get isPortrait => deviceOrientation == Orientation.portrait;
}

class YSpace extends StatelessWidget {
  final double _height;
  YSpace(this._height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}

class XSpace extends StatelessWidget {
  final double _width;

  XSpace(this._width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}
