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
        color: epic.inProgress()
            ? EnumColors.gray.color()
            : EnumColors.white.color(),
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              EnumOffsets.offset16.offset(),
              EnumOffsets.offset16.offset(),
              EnumOffsets.offset16.offset(),
              EnumOffsets.offset8.offset()),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    epic.name,
                    style: TextStyleExtension.generate(
                        size: 22, style: EnumFontStyle.bold),
                    textAlign: TextAlign.left,
                    maxLines: 3,
                  )),
              SizedBox(
                height: EnumOffsets.offset8.offset(),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                    width: 150,
                    child: Text(
                      'Вопросов: ${epic.qwestions.length}',
                      textAlign: TextAlign.left,
                      style: TextStyleExtension.generate(
                          size: 16, style: EnumFontStyle.regular),
                    )),
              )
            ],
          ),
        ));
  }
}
