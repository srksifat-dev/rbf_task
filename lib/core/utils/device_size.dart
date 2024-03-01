import 'package:flutter/material.dart';

extension DeviceSizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get blockSizeHorizontal => screenWidth / 100;
  double get blockSizeVertical => screenHeight / 100;

  // Function to get responsive width
  double wp(double widthPercent) {
    return widthPercent * screenWidth / 100;
  }

  // Function to get responsive height
  double hp(double heightPercent) {
    return heightPercent * screenHeight / 100;
  }
}
