class AnswerTest {
  final int indexTrue;
  final int? indexWrong;

  AnswerTest({required this.indexTrue, this.indexWrong});

  factory AnswerTest.fromJson(Map<String, dynamic> json) {
    final int indexTrue = json['indexTrue'] ?? 0;
    final int? indexWrong = json['indexWrong'];

    return AnswerTest(indexTrue: indexTrue, indexWrong: indexWrong);
  }

  bool isWrong() {
    return indexWrong != null;
  }
}
