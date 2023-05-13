import 'package:flutter/material.dart';

enum EnumColors { white, black, clear, gray, red }

extension EnumColorsExtension on EnumColors {
  Color color() {
    switch (this) {
      case EnumColors.white:
        return Colors.white;
      case EnumColors.black:
        return Colors.black;
      case EnumColors.clear:
        return const Color.fromARGB(0, 0, 0, 0);
      case EnumColors.gray:
        return const Color.fromARGB(255, 209, 209, 209);
      case EnumColors.red:
        return Colors.red;
    }
  }
}
