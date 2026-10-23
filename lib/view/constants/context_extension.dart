import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicMultiHeight(double value) =>
      MediaQuery.of(this).size.height * value;
  double dynamicMultiWidth(double value) =>
      MediaQuery.of(this).size.width * value;

  double dynamicHeight(double value) => MediaQuery.of(this).size.height / value;
  double dynamicWidth(double value) => MediaQuery.of(this).size.width / value;
}
