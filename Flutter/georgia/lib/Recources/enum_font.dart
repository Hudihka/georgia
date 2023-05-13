import 'package:georgia/Recources/enum_colors.dart';
import 'package:flutter/material.dart';

enum EnumFontStyle { light, regular, medium, semiBold, bold }

extension _EnumFontExtension on EnumFontStyle {
  FontWeight size() {
    switch (this) {
      case EnumFontStyle.light:
        return FontWeight.w300;
      case EnumFontStyle.regular:
        return FontWeight.w400;
      case EnumFontStyle.medium:
        return FontWeight.w500;
      case EnumFontStyle.semiBold:
        return FontWeight.w600;
      case EnumFontStyle.bold:
        return FontWeight.w700;
    }
  }
}

extension TextStyleExtension on TextStyle {
  static TextStyle generate(
      {EnumFontStyle style = EnumFontStyle.regular,
      double size = 10,
      EnumColors color = EnumColors.black}) {
    return TextStyle(
        fontSize: size, fontWeight: style.size(), color: color.color());
  }

  static TextStyle generateSemibold(
      {double size = 10, EnumColors color = EnumColors.black}) {
    return TextStyleExtension.generate(
        size: size, color: color, style: EnumFontStyle.semiBold);
  }
}
