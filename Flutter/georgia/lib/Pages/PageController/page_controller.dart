import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:georgia/Pages/PageController/qwestion_controller.dart';

class MyPageView extends StatefulWidget {
  final List<Qwestion> qwestions;
  const MyPageView({super.key, required this.qwestions});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const BouncingScrollPhysics(),
      onPageChanged: (value) {
        print(value);
      },
      controller: _pageController,
      children: _generatePage(),
    );
  }

  List<Widget> _generatePage() {
    return widget.qwestions
        .map((e) => QwestionController(qwestion: e))
        .toList();
  }
}
