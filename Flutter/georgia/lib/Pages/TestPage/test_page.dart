import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Pages/TestPage/cell_collection.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_font.dart';
import 'package:georgia/Recources/enum_offsets.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Model/option.dart';
import '../../Support/constant.dart';
import '../PageController/page_controller.dart';

class TestPage extends StatelessWidget {
  final EpicWithQwestion epic;
  final double _heightCollection = 46;

  final GlobalKey<MyPageViewState> _myKey = GlobalKey();
  late MyPageView _pageview;

  late ScrollablePositionedList _collection;

  TestPage({required this.epic});

  ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    _initPageView();
    _intCollection();

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
        body: Column(
          children: [
            // MARK: - CollectionView
            SizedBox(
              width: double.infinity,
              height: 46,
              child: _collection,
            ),
            // MARK: - PageViewController
            Container(
              width: double.infinity,
              height: Const.fullHeightBody - _heightCollection,
              child: _pageview,
            )
          ],
        ));
  }

  void _initPageView() {
    int firstIndex =
        epic.qwestions.indexWhere((element) => element.answerTest != null);
    int index = firstIndex == -1 ? 0 : firstIndex;

    _pageview = MyPageView(
      key: _myKey,
      qwestions: epic.qwestions,
      firstIndex: 9,
    );

    _pageview.selectIndexPage = (index) {
      _collection.itemScrollController
          ?.scrollTo(index: index, duration: Duration(milliseconds: 250));
    };
  }

  void _intCollection() {
    _collection = ScrollablePositionedList.builder(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemScrollController: _scrollController,
      itemCount: epic.qwestions.length,
      itemBuilder: (context, index) {
        final Option option = epic.qwestions[index].option;
        return Padding(
            padding: EdgeInsets.fromLTRB(
                index != 0 ? 4 : 8,
                EnumOffsets.offset8.offset(),
                index != epic.qwestions.length - 1 ? 4 : 8,
                EnumOffsets.offset8.offset()),
            child: GestureDetector(
              onTap: () {
                _myKey.currentState?.scrollToIndex(index: index);
              },
              child: CellCollection(
                  index: index + 1, isSelected: false, option: option),
            ));
      },
    );
  }
}
