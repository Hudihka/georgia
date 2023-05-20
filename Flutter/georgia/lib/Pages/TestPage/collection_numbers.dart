import 'package:flutter/cupertino.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../Model/epic_with_qwestion.dart';
import '../../Model/option.dart';
import '../../Recources/enum_offsets.dart';
import 'cell_collection.dart';

class CollectionNumbers extends StatefulWidget {
  final EpicWithQwestion epic;
  int indexScroll;

  late Function(int) selectNumber;

  CollectionNumbers({super.key, required this.epic, required this.indexScroll});

  @override
  State<CollectionNumbers> createState() => CollectionNumbersState();
}

class CollectionNumbersState extends State<CollectionNumbers> {
  ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ScrollablePositionedList.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        initialScrollIndex: widget.indexScroll,
        itemScrollController: _scrollController,
        itemCount: widget.epic.qwestions.length,
        itemBuilder: (context, index) {
          final Option option = widget.epic.qwestions[index].option;
          return Padding(
              padding: EdgeInsets.fromLTRB(
                  index != 0 ? 4 : 8,
                  EnumOffsets.offset8.offset(),
                  index != widget.epic.qwestions.length - 1 ? 4 : 8,
                  EnumOffsets.offset8.offset()),
              child: GestureDetector(
                onTap: () {
                  changeIndex(index: index, callUpdate: true);
                },
                child: CellCollection(
                    index: index + 1,
                    isSelected: widget.indexScroll == index,
                    option: option),
              ));
        },
      ),
    );
  }

  void changeIndex({required int index, required bool callUpdate}) {
    _scrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutQuad);
    widget.indexScroll = index;

    if (callUpdate) {
      widget.selectNumber(index);
    }

    setState(() {});
  }
}
