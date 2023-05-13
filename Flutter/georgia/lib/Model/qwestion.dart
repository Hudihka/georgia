import 'package:georgia/Model/option.dart';
import 'package:georgia/Model/answer.dart';
import 'package:georgia/Model/answer_test.dart';

class Qwestion {
  final int idQwestion;
  final String title;
  final Answer answer;
  Option option = Option.clearOption;
  final AnswerTest? answerTest;

  Qwestion(this.answerTest,
      {required this.idQwestion, required this.title, required this.answer});
}
