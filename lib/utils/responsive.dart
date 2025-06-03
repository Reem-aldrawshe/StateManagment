import 'package:flutter/material.dart';

double responsive(context, double size) {
  double width = MediaQuery.of(context).size.width;
  double screenWidth = 375;
  return (size / screenWidth) * width;
}

double responsiveHeight(BuildContext context, double size) {
  double height = MediaQuery.of(context).size.height;
  return (size / 812) * height;
}
