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
import 'collection_numbers.dart';

class TestPage extends StatelessWidget {
  final EpicWithQwestion epic;
  final double _heightCollection = 46;

  final GlobalKey<MyPageViewState> _myKeyPage = GlobalKey();
  late MyPageView _pageview;

  final GlobalKey<CollectionNumbersState> _myKeyCollection = GlobalKey();
  late CollectionNumbers _collection;

  TestPage({required this.epic});

  @override
  Widget build(BuildContext context) {
    int firstIndex =
        epic.qwestions.indexWhere((element) => element.answerTest != null);
    int indexScroll = firstIndex == -1 ? 0 : firstIndex;

    _initPageView(indexScroll);
    _intCollection(indexScroll);

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
            _collection,
            // MARK: - PageViewController
            Container(
              width: double.infinity,
              height: Const.fullHeightBody - _heightCollection,
              child: _pageview,
            )
          ],
        ));
  }

  void _initPageView(int indexScroll) {
    _pageview = MyPageView(
      key: _myKeyPage,
      qwestions: epic.qwestions,
      firstIndex: indexScroll,
    );

    _pageview.selectIndexPage = (index) {
      _myKeyCollection.currentState?.changeIndexFromPage(index: index);
    };
  }

  void _intCollection(int indexScroll) {
    _collection = CollectionNumbers(
        key: _myKeyCollection, epic: epic, indexScroll: indexScroll);

    _collection.selectNumber = (index) {
      _myKeyPage.currentState?.scrollToIndex(index: index);
    };
  }
}
