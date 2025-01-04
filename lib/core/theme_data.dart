import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phones/shared/palette.dart';

ThemeData buildTheme() {
  ThemeData baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Palette.primary,
    ),
    useMaterial3: true,
  );

  return baseTheme.copyWith(
    textTheme: GoogleFonts.nunitoTextTheme(
      baseTheme.textTheme,
    ),
  );
}
