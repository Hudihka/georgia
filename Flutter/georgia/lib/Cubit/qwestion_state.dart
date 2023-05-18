import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Data/content.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:collection/collection.dart';

abstract class QwestionState {}

class EpicContent extends QwestionState {
  final List<EpicWithQwestion> listEpic;

  EpicContent({required this.listEpic});

  factory EpicContent.generateBase() {
    return EpicContent(listEpic: Content.epicQwestions);
  }

  EpicContent copyWithList(List<EpicWithQwestion> listEpic) {
    return EpicContent(listEpic: listEpic);
  }

// тапнули на один вопрос
  EpicContent copyWithEpic(
      {required Qwestion qwestion,
      required int indexEpic,
      required int indexQwestion}) {
    final EpicWithQwestion selectedEpic = listEpic[indexEpic];
    List<Qwestion> qwestions = selectedEpic.qwestions;
    qwestions[indexQwestion] = qwestion;

    EpicWithQwestion newEpic =
        EpicWithQwestion(name: selectedEpic.name, qwestions: qwestions);

    listEpic[indexEpic] = newEpic;

    return EpicContent(listEpic: listEpic);
  }
}
