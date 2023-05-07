import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_app/Core/color1.dart';

abstract class Style {
  static var textStyle32 = GoogleFonts.lato(
    textStyle: const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
      color: Color1.primaryColor,
    ),
  );

  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const textStyle12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
}