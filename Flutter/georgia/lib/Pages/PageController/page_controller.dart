import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:georgia/Pages/PageController/qwestion_controller.dart';

class MyPageView extends StatefulWidget {
  final List<Qwestion> qwestions;
  int firstIndex = 0;

  late Function(int) selectIndexPage;

  MyPageView({super.key, required this.qwestions, this.firstIndex = 0});

  @override
  State<MyPageView> createState() => MyPageViewState();
}

class MyPageViewState extends State<MyPageView> {
  late PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageController = PageController(initialPage: widget.firstIndex);

    return PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        widget.selectIndexPage(value);
      },
      controller: _pageController,
      children: _generatePage(),
    );
  }

  List<Widget> _generatePage() {
    List<Widget> widgets = [];
    widget.qwestions.asMap().forEach((key, value) {
      widgets.add(QwestionController(qwestion: value, indexQwestion: key));
    });

    return widgets;
  }

  void scrollToIndex({required int index}) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }
}
