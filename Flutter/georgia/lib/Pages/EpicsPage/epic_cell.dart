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
              Row(
                children: [
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
                  ),
                  const Spacer(),
                  _rowProgress()
                ],
              )
            ],
          ),
        ));
  }

  Widget _rowProgress() {
    if (epic.procent() == 0) {
      return Row();
    }

    Widget procent = SizedBox(
        width: 50,
        child: Text(
          '${epic.procent()}%',
          textAlign: TextAlign.right,
          style:
              TextStyleExtension.generate(size: 16, style: EnumFontStyle.bold),
        ));

    final int misstakes = epic.mistakes();

    if (misstakes != 0) {
      return Row(
        children: [
          procent,
          SizedBox(
            height: EnumOffsets.offset8.offset(),
          ),
          SizedBox(
              width: 50,
              child: Text(
                '${epic.mistakes()}/${epic.qwestions.length}',
                textAlign: TextAlign.right,
                style: TextStyleExtension.generate(
                    size: 16, style: EnumFontStyle.bold, color: EnumColors.red),
              )),
        ],
      );
    } else {
      return procent;
    }
  }
}
