import 'package:georgia/Model/option.dart';
import 'package:georgia/Model/answer.dart';
import 'package:georgia/Model/answer_test.dart';

class Qwestion {
  final int idQwestion;
  final String title;
  final Answer answer;
  Option option = Option.clearOption;
  final AnswerTest? answerTest;

  factory Qwestion.fromJson(Map<String, dynamic> json) {
    final int idQwestion = json['idQwestion'] ?? 0;
    final String title = json['title'] ?? 'title';

    final Map<String, dynamic> answerJson = json['answer'] ?? {};
    final Answer answer = Answer.fromJson(answerJson);

    final Option opinion = OptionExtension.getOption(json['option'] ?? "");

    final Map<String, dynamic>? answerTestJson = json['answer'];
    final AnswerTest? answerTest =
        answerTestJson == null ? null : AnswerTest.fromJson(answerTestJson);

    return Qwestion(
        idQwestion: idQwestion,
        title: title,
        answer: answer,
        option: opinion,
        answerTest: answerTest);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'idQwestion': idQwestion,
      'title': title,
      'answer': answer.toJson(),
      'option': option.toString()
    };

    if (answerTest != null) {
      json['answerTest'] = answerTest!.toJson();
    }

    return json;
  }

  Qwestion(
      {required this.idQwestion,
      required this.title,
      required this.answer,
      this.answerTest});
}
