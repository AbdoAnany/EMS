// @dart=2.9
import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width>700?700:_mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height>1200?1200:_mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

// Get the proportionate height as per screen size
double h(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // screenHeight = SizeConfig.screenWidth<SizeConfig.screenHeight ?SizeConfig.screenHeight:SizeConfig.screenWidth;

  // 812 is the layout height that designer use
  return (inputHeight / 912.0) * screenHeight;
}

// Get the proportionate height as per screen size
double w(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  //  screenWidth = SizeConfig.screenWidth>SizeConfig.screenHeight ?SizeConfig.screenHeight:SizeConfig.screenWidth;
  // 375 is the layout width that designer use

  return (inputWidth / 390.0) * screenWidth;
}
