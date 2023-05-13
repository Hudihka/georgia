import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

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
      children: <Widget>[
        _generateText(0),
        _generateText(1),
        _generateText(2),
        _generateText(3),
        _generateText(4),
        _generateText(5),
        _generateText(6),
        _generateText(7),
        _generateText(8),
        _generateText(9),
        _generateText(10)
      ],
    );
  }

  Widget _generateText(int ind) {
    return ColoredBox(
      color: Colors.red,
      child: Center(
        child: Text('$ind'),
      ),
    );
  }
}
