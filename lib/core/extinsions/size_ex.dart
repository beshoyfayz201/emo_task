import 'package:flutter/material.dart';

extension MediaQueryValues on BuildContext {
  // Full screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  // Full screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  // Screen orientation
  Orientation get orientation => MediaQuery.of(this).orientation;

  // Is the screen in landscape mode
  bool get isLandscape => orientation == Orientation.landscape;

  // Is the screen in portrait mode
  bool get isPortrait => orientation == Orientation.portrait;

  // Get a fraction of the screen width
  double widthPct(double percent) => screenWidth * percent;

  // Get a fraction of the screen height
  double heightPct(double percent) => screenHeight * percent;
}
