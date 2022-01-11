import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:urancodetest/resources/resources.dart';

class DimensionConfig {
  // this is where we control the dimension of our app....
  double? screenWidth;
  double? screenHeight;
  double? padding;
  double? horizontalPadding;
  double? verticalPadding;
  double? smallVerticalPadding;
  double? smallHorizonalPadding;
  double? textFontSize;
  double? header1FontSize;
  double? header2FontSize;
  double? header3FontSize;
  double? buttonHeight;
  double? buttonborderRadius;
  double? textFieldBorderRadius;
  MediaQueryData? mediaQueryData;

  DimensionConfig({
    this.screenWidth,
    this.screenHeight,
    this.padding,
    this.textFontSize,
    this.smallVerticalPadding,
    this.smallHorizonalPadding,
    this.horizontalPadding,
    this.verticalPadding,
    this.buttonHeight,
    this.buttonborderRadius,
    this.header1FontSize,
    this.header2FontSize,
    this.header3FontSize,
    this.mediaQueryData,
    this.textFieldBorderRadius,
  });
  void init(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
    setSizes();
  }

  void setSizes() {
    if (screenHeight != null && screenWidth != null) {
      if (screenHeight! >= bigScreenHeight) {
        padding = paddingBigScreen;
        textFontSize = textFontSizeBigScreen;
        buttonHeight = buttonHeightBigScreen;
        buttonborderRadius = buttonborderRadiusBigScreen;
        horizontalPadding = horizontalPaddingBigScreen;
        smallHorizonalPadding = smallHorizonalPaddingBigScreen;
        verticalPadding = verticalPaddingBigScreen;
        smallVerticalPadding = smallVerticalPaddingBigScreen;
        header1FontSize = header1FontSizeBigScreen;
        header2FontSize = header2FontSizeBigScreen;
        header3FontSize = header3FontSizeBigScreen;
        textFieldBorderRadius = textFieldBorderRadiusBigScreen;
        log("Big screen");
      } else if (screenHeight! <= smallScreenHeight) {
        buttonHeight = buttonHeightSmallScreen;
        buttonborderRadius = buttonborderRadiusSmallScreen;
        horizontalPadding = horizontalPaddingSmallScreen;
        smallHorizonalPadding = smallHorizonalPaddingSmallScreen;
        verticalPadding = verticalPaddingSmallScreen;
        smallVerticalPadding = smallVerticalPaddingSmallScreen;
        header3FontSize = header3FontSizeSmallScreen;
        header2FontSize = header2FontSizeSmallScreen;
        header1FontSize = header1FontSizeSmallScreen;
        textFontSize = textFontSizeSmallScreen;
        padding = paddingSmallScreen;
        textFieldBorderRadius = textFieldBorderRadiusSmallScreen;
        log("small screen");
      } else {
        log("medium screen");
        buttonHeight = buttonHeightMediumScreen;
        buttonborderRadius = buttonborderRadiusMediumScreen;
        horizontalPadding = horizontalPaddingMediumScreen;
        smallHorizonalPadding = smallHorizonalPaddingMediumScreen;
        verticalPadding = verticalPaddingMediumScreen;
        smallVerticalPadding = smallVerticalPaddingMediumScreen;
        header1FontSize = header1FontSizeMediumScreen;
        header2FontSize = header2FontSizeMediumScreen;
        header3FontSize = header3FontSizeMediumScreen;
        textFontSize = textFontSizeMediumScreen;
        padding = paddingMediumScreen;
        textFieldBorderRadius = textFieldBorderRadiusMediumScreen;
      }
    } else {}
  }
}
