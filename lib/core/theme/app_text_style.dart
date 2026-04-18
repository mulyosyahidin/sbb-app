import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle hero({Color? color, FontWeight? fontWeight}) => GoogleFonts.lexend(
        fontSize: 32,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: 1.2,
      );

  static TextStyle title({Color? color, double? fontSize, double? letterSpacing, FontWeight? fontWeight}) => GoogleFonts.lexend(
        fontSize: fontSize ?? 20,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.8,
      );

  static TextStyle heading({Color? color, FontWeight? fontWeight}) => GoogleFonts.lexend(
        fontSize: 22,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: 0.4,
      );

  static TextStyle body({Color? color, double? fontSize, double? letterSpacing, FontWeight? fontWeight}) =>
      GoogleFonts.lexend(
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        letterSpacing: letterSpacing ?? 0.1,
      );

  // Label: for small text or badges
  static TextStyle label({Color? color, double? fontSize, double? letterSpacing, FontWeight? fontWeight}) =>
      GoogleFonts.lexend(
        fontSize: fontSize ?? 10,
        color: color,
        letterSpacing: letterSpacing ?? 2.0,
        fontWeight: fontWeight ?? FontWeight.w600,
      );
}
