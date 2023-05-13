import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_font.dart';
import 'Pages/EpicsPage/epic_cell.dart';
import 'package:georgia/Recources/enum_offsets.dart';

import 'package:georgia/Data/content.dart';

class EpicsPage extends StatelessWidget {
  List<EpicWithQwestion> _content = Content.epicQwestions;

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
          centerTitle: true,
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
                return EpicCell(epi)
                
                StickyHeader(
                  header: HederCell(group: content[index]),
                  content: _listCells(words: content[index].words),
                );
              }),
        ));
  }
}
