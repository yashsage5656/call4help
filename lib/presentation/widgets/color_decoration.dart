import 'package:flutter/material.dart';

class AppDecoration {
  static const LinearGradient defaultGradient = LinearGradient(
    colors: [
      Color(0xFF8B806F),
      Color(0xFFE8DECC),
      Color(0xFF8B806F),
      Color(0xFFB3AEA9),
      Color(0xFF8B8C88),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const BoxDecoration gradientBackground = BoxDecoration(
    gradient: defaultGradient,
  );
}
