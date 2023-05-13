import 'package:flutter/cupertino.dart';
import 'package:georgia/Model/option.dart';
import 'package:georgia/Recources/enum_colors.dart';

import '../../Recources/enum_font.dart';

class CellCollection extends StatelessWidget {
  final int index;
  final bool isSelected;
  final Option option;

  CellCollection(
      {required this.index, required this.isSelected, required this.option});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: _colorCell().color(),
          border: Border.all(
              color: EnumColors.black.color(), width: isSelected ? 5 : 2),
          borderRadius: BorderRadius.all(Radius.circular(6))),
      width: 40,
      height: 30,
      child: Center(
        child: Text(
          '$index',
          textAlign: TextAlign.center,
          style: TextStyleExtension.generate(
              size: 16, style: EnumFontStyle.regular),
        ),
      ),
    );
  }

  EnumColors _colorCell() {
    // trueOption, falseOption, clearOption
    switch (option) {
      case Option.trueOption:
        return EnumColors.green;

      case Option.falseOption:
        return EnumColors.red;

      case Option.clearOption:
        return EnumColors.white;
    }
  }
}
