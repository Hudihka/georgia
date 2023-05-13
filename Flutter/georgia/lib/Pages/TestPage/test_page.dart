import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Pages/EpicsPage/epic_cell.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_font.dart';
import 'package:georgia/Recources/enum_offsets.dart';

import '../../Support/constant.dart';

class TestPage extends StatelessWidget {
  final EpicWithQwestion epic;

  TestPage({required this.epic});

  @override
  Widget build(BuildContext context) {
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
              epic.name,
              textAlign: TextAlign.center,
              style: TextStyleExtension.generateSemibold(size: 23),
            ),
            backgroundColor: EnumColors.white.color(),
            shadowColor: EnumColors.clear.color(),
            automaticallyImplyLeading: false,
            leading: Const.itIOS
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: EnumColors.black.color(),
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop('dialog');
                    },
                  )
                : null),
        body: Center(
          child: Text(epic.name),
        ));
  }
}
