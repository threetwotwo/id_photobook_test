import 'package:flutter/material.dart';

class AppColors {
  static final yellow = hexToColor('#FFCA28');
  static final Color sunglow = Color.fromRGBO(255, 202, 40, 1);
  static final Color mantis = Color.fromRGBO(126, 213, 66, 1);
  static final Color monaLisa = Color.fromRGBO(255, 138, 128, 1);
  static final Color torchRed = Color.fromRGBO(255, 23, 68, 1);
  static final Color gyold = Color.fromRGBO(177, 110, 0, 1);
  static final Color catNose = Color.fromRGBO(255, 221, 163, 1);
  static final Color charleysBogger = Color.fromRGBO(126, 211, 33, 1);
  static final Color blondie = Color.fromRGBO(254, 207, 57, 1);
  static final Color orangePeel = Color.fromRGBO(255, 162, 0, 1);
  static final Color yellowGreen = Color.fromRGBO(126, 211, 33, 1);
  static final Color matterhorn = Color.fromRGBO(81, 81, 81, 1);
  static final Color goldenTainoi = Color.fromRGBO(255, 200, 86, 1);
  static final Color goldenFizz = Color.fromRGBO(243, 215, 59, 1);
  static final Color gray90 = Color.fromRGBO(259, 259, 259, 1);
  static final Color gray77 = Color.fromRGBO(196, 196, 196, 1);
  static final Color gray55 = Color.fromRGBO(140, 140, 140, 1);
  static final Color whiteOnYellow = HexColor('#FBF6E7');
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
