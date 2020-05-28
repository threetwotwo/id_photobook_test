import 'package:flutter/material.dart';

class AppColors {
  static final yellow = hexToColor('#FFCA28');
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
