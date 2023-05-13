import 'package:flutter/material.dart';

enum EnumImages { favorit, not_favorit }

extension EnumImagesExtension on EnumImages {
  String _name() {
    String name = this.name;
    return 'assets/images/$name.jpg';
  }

  AssetImage imageAssets() {
    return AssetImage(_name());
  }

  Image image() {
    return Image.asset(_name());
  }
}
