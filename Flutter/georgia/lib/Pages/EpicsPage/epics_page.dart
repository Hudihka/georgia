import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:georgia/Data/user_def.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Model/answer.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:georgia/Pages/EpicsPage/epic_cell.dart';
import 'package:georgia/Pages/TestPage/test_page.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_font.dart';
import 'package:georgia/Recources/enum_offsets.dart';

import 'package:collection/collection.dart';
import 'package:georgia/Data/content.dart';
import '../../Support/constant.dart';

class EpicsPage extends StatelessWidget {
  List<EpicWithQwestion> _content = [];

  @override
  Widget build(BuildContext context) {
    Const.setSize(context);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Темы',
            textAlign: TextAlign.center,
            style: TextStyleExtension.generateSemibold(size: 23),
          ),
          backgroundColor: EnumColors.white.color(),
          shadowColor: EnumColors.clear.color(),
        ),
        body: Container(
          width: double.infinity,
          color: EnumColors.white.color(),
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: _content.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () async {
                    final epic = _content[index];
                    final bool isEmptyEpic = epic.qwestions
                            .firstWhereOrNull((e) => e.answerTest != null) ==
                        null;

                    // сохраняем индекс эпика

                    _showAlertDialog(context: context, epic: epic);

                    // if (isEmptyEpic == false) {
                    //   _showAlertDialog(context: context, epic: epic);
                    // } else {
                    //   _showTest(epic, context);
                    // }
                  },
                  child: EpicCell(epic: _content[index]),
                );
              }),
        ));
  }

  void _showTest(EpicWithQwestion epic, BuildContext context) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => TestPage(epic: epic),
      ),
    );
  }

  void _showAlertDialog(
      {required BuildContext context, required EpicWithQwestion epic}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Продолжить"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _showTest(epic, context);
      },
    );

    Widget continueButton = TextButton(
      child: Text("Начать с начала",
          style: TextStyle(color: EnumColors.red.color())),
      onPressed: () {
        // удаляем сохраненки
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _showTest(epic, context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Хотите продолжить ${epic.name}?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
