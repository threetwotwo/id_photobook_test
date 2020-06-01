import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static final baseStyle = GoogleFonts.nunito().copyWith(color: Colors.black);

  static final h18ExtraBold =
      baseStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 18);

  static final h14ExtraBold =
      baseStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 14);

  static final h13ExtraBold =
      baseStyle.copyWith(fontWeight: FontWeight.w900, fontSize: 13);

  static final h14Bold =
      baseStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 14);

  static final h14Normal = baseStyle.copyWith(fontSize: 14);

  static final b12Normal = baseStyle.copyWith(fontSize: 12);

  static final b12Bold =
      baseStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 12);
}
