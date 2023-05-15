import 'package:georgia/Model/option.dart';
import 'package:georgia/Model/answer.dart';
import 'package:georgia/Model/answer_test.dart';

class Qwestion {
  final int idQwestion;
  final String title;
  final Answer answer;
  Option option = Option.clearOption;
  final AnswerTest? answerTest;

  // factory Qwestion.fromJson(Map<String, dynamic> json) {
  //   final int indexTrue = json['idQwestion'] ?? 0;
  //   final String title = json['title'] ?? 'title';

  //   final Map<String, dynamic> answerJson = json['answer'] ?? {};
  //   final Answer answer = Answer.fromJson(answerJson);

  //   final int? indexWrong = json['indexWrong'];

  //   return Qwestion(indexTrue: indexTrue, indexWrong: indexWrong);
  // }

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
