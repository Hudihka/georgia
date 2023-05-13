import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_font.dart';
import 'package:georgia/Recources/enum_offsets.dart';

class EpicCell extends StatelessWidget {
  EpicCell({super.key, required this.epic});

  EpicWithQwestion epic;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: EnumColors.gray.color(),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: EnumOffsets.offset16.offset(),
              vertical: EnumOffsets.offset6.offset()),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  EnumTexts.sections.getText() + " " + group.number.toString(),
                  style: TextStyleExtension.generate(
                      size: 20, style: EnumFontStyle.bold),
                ),
              ),
              SizedBox(
                width: EnumOffsets.offset6.offset(),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    textAlign: TextAlign.left,
                    group.description,
                    style: TextStyleExtension.generate(
                        size: 18, style: EnumFontStyle.regular),
                  ))
            ],
          ),
        ));
  }
}
