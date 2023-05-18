import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Data/content.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:collection/collection.dart';

abstract class QwestionState {}

class EpicContentState extends QwestionState {
  final List<EpicWithQwestion> listEpic;

  EpicContentState({required this.listEpic});

  factory EpicContentState.generateBase() {
    return EpicContentState(listEpic: Content.epicQwestions);
  }

  EpicContentState copyWithList(List<EpicWithQwestion> listEpic) {
    return EpicContentState(listEpic: listEpic);
  }

// тапнули на один вопрос
  EpicContentState copyWithEpic(
      {required Qwestion qwestion,
      required int indexEpic,
      required int indexQwestion}) {
    final EpicWithQwestion selectedEpic = listEpic[indexEpic];
    List<Qwestion> qwestions = selectedEpic.qwestions;
    qwestions[indexQwestion] = qwestion;

    EpicWithQwestion newEpic =
        EpicWithQwestion(name: selectedEpic.name, qwestions: qwestions);

    listEpic[indexEpic] = newEpic;

    return EpicContentState(listEpic: listEpic);
  }
}
