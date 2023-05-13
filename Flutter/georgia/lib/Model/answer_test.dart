class AnswerTest {
  final int indexTrue;
  final int? indexWrong;

  AnswerTest({required this.indexTrue, this.indexWrong});

  bool isWrong() {
    return indexWrong != null;
  }
}
