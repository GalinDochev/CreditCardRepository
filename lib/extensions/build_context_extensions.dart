import 'package:flutter/material.dart';

extension ContextExtention on BuildContext {
  double get _width => MediaQuery.of(this).size.width;
  double get _height => MediaQuery.of(this).size.height;

  double setWidth(double percent) {
    final decimalPercentage = _getDecimalPercentage(percent);
    return _width * decimalPercentage;
  }

  double setHeight(double percent) {
    final decimalPercentage = _getDecimalPercentage(percent);
    return _height * decimalPercentage;
  }
  _getDecimalPercentage(double percent) {
    return percent / 100;
  }

  double setHorizontalPadding(BuildContext context, double percent) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return _getDecimalPercentage(percent) * screenWidth;
  }

  double setVerticalPadding(BuildContext context, double percent) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return _getDecimalPercentage(percent) * screenHeight;
  }
}
