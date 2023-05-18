import 'package:bloc/bloc.dart';
import 'package:georgia/Cubit/qwestion_state.dart';
import 'package:georgia/Model/answer_test.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Model/qwestion.dart';
import '../Data/user_def.dart';

class GroupCubit extends Cubit<QwestionState> {
  final _ud = UserDefaults.shared;
  final EpicContentState groupState;

  int _indexSelectedEpic = 0;

  GroupCubit(this.groupState) : super(EpicContentState.generateBase());

  Future<void> fetchContent() async {
    List<EpicWithQwestion> epics = [];

    for (var i = 0; i < groupState.listEpic.length; i++) {
      List<Qwestion> list = [];
      final EpicWithQwestion epic = groupState.listEpic[i];
      List<Qwestion> qwestions = epic.qwestions;

      qwestions.asMap().forEach((index, qwestion) async {
        Qwestion newQwestion =
            await _ud.getSaveQwestion(qwestion.idQwestion) ?? qwestions[index];
        list.add(newQwestion);
      });

      epics.add(EpicWithQwestion(name: epic.name, qwestions: list));
    }

    emit(groupState.copyWithList(epics));
  }

  void changeIndexEpic(int newIndex) {
    _indexSelectedEpic = newIndex;
  }

  Future<void> tapedAnswer(
      Qwestion qwestion, int indexAnswer, int indexQwestion) async {
    final bool trueAnswer = indexAnswer == qwestion.answer.rightOpinion;
    if (!trueAnswer) {
      // вибрация
    }

    final Qwestion newQwestion = Qwestion(
        idQwestion: qwestion.idQwestion,
        title: qwestion.title,
        answer: qwestion.answer,
        answerTest: AnswerTest(
            indexTrue: qwestion.answer.rightOpinion,
            indexWrong: trueAnswer ? null : indexAnswer));

    _ud.saveQwestion(newQwestion);

    emit(groupState.copyWithEpic(
        qwestion: newQwestion,
        indexEpic: _indexSelectedEpic,
        indexQwestion: indexQwestion));
  }

  void clearEpic(EpicWithQwestion epic) {
    List<Qwestion> newListQwestions = epic.qwestions.map((e) {
      _ud.removeQwestion(e.idQwestion);

      return Qwestion.copyWithEmptyAnswer(e);
    }).toList();

    List<EpicWithQwestion> newList = groupState.listEpic;

    final newEpic =
        EpicWithQwestion(name: epic.name, qwestions: newListQwestions);
    newList[_indexSelectedEpic] = newEpic;

    emit(groupState.copyWithList(newList));
  }
}
