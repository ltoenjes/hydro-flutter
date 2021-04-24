import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  textTheme: GoogleFonts.sarabunTextTheme(),
  primaryColorDark: const Color(0xFF137528),
  primaryColorLight: const Color(0xFF32e659),
  primaryColor: const Color(0xFF28b847),
  accentColor: const Color(0xFF1ddec1),
  scaffoldBackgroundColor: const Color(0xFFE0F2F1),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);
