import 'package:georgia/Model/qwestion.dart';

class EpicWithQwestion {
  final String name;
  final List<Qwestion> qwestions;

  EpicWithQwestion({required this.name, required this.qwestions});

  bool inProgress() {
    return qwestions.where((e) => e.answerTest != null).isNotEmpty;
  }

  int procent() {
    int count = 100 * qwestions.where((e) => e.answerTest != null).length;

    return count ~/ qwestions.length;
  }

  int mistakes() {
    return qwestions.where((e) => e.answerTest?.indexWrong != null).length;
  }

  int? activeindex() {
    return qwestions.where((e) => e.answerTest != null).isEmpty
        ? null
        : qwestions.indexWhere((e) => e.answerTest == null);
  }
}
