import 'package:flutter/material.dart';
import 'package:georgia/Model/epic_with_qwestion.dart';
import 'package:georgia/Data/content.dart';
import 'package:georgia/Model/qwestion.dart';

abstract class QwestionState {}

class EpicContent extends QwestionState {
  List<EpicWithQwestion> listEpic = Content.epicQwestions;

  EpicContent({required this.listEpic});

  factory EpicContent.generateBase() {
    return EpicContent(listEpic: Content.epicQwestions);
  }

  EpicContent copyWith(Qwestion qwestion) {
    int indexQwestion = 0;
    int indexEpic = 0;

    for (var i = 0; i < listEpic.length; i++) {
      int indexQw = listEpic[i]
          .qwestions
          .indexWhere((qw) => qw.idQwestion == qwestion.idQwestion);

      if (indexQw != -1) {
        indexEpic = i;
        indexQwestion = indexQw;

        break;
      }
    }

    listEpic[indexEpic].qwestions[indexQwestion] = qwestion;

    return EpicContent(listEpic: listEpic);
  }

  EpicContent copyWithList(List<EpicWithQwestion> listEpic) {
    return EpicContent(listEpic: listEpic);
  }

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
