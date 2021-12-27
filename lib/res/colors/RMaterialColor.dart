
import 'package:flutter/material.dart';

class RMaterialColor {
  static final Map<int, Color> _primaryMap = {
    50: Colors.white,
    100: Colors.white,
    200: Colors.white,
    300: Colors.white,
    400: Colors.white,
    500: Colors.white,
    600: Colors.white,
    700: Colors.white,
    800: Colors.white,
    900: Colors.white12,
  };

  static final MaterialColor PrimarySwatchColor =
      MaterialColor(Colors.white.value, _primaryMap);
}
