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

import 'package:georgia/Data/content.dart';
import '../../Support/constant.dart';

class EpicsPage extends StatelessWidget {
  List<EpicWithQwestion> _content = Content.epicQwestions;

  @override
  Widget build(BuildContext context) {
    Const.setSize(context);

    // _contentCubit = context.read();

    // SingltonsCubit.shared.saveGroupCubit(_contentCubit);

    // _contentCubit.fetchContent();
    // if (state is GroupContent) {
    //   _index = state.index;
    //   _switchValue = state.switchValue;
    //   _listGroup = _index == 0 ? state.listGroup : state.listSelectedGroups;
    // }

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
                    // Navigator.of(context).push(
                    //   CupertinoPageRoute(
                    //     fullscreenDialog: true,
                    //     builder: (context) => TestPage(epic: _content[index]),
                    //   ),
                    // );
                  },
                  child: EpicCell(epic: _content[index]),
                );
              }),
        ));
  }
}
