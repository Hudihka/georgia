import 'package:georgia/Model/qwestion.dart';

class EpicWithQwestion {
  final String name;
  final List<Qwestion> qwestions;

  EpicWithQwestion({required this.name, required this.qwestions});

  bool inProgress() {
    return qwestions.map((e) => e.answerTest != null).isNotEmpty;
  }

  int procent() {
    int count = 100 * qwestions.map((e) => e.answerTest != null).length;

    return count ~/ qwestions.length;
  }

  int mistakes() {
    return qwestions.map((e) => e.answerTest?.indexWrong ?? false).length;
  }

  int? activeindex() {
    return qwestions.map((e) => e.answerTest != null).isEmpty
        ? null
        : qwestions.indexWhere((e) => e.answerTest == null);
  }
}
