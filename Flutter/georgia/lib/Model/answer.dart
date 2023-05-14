class Answer {
  final int rightOpinion;
  final String fist;
  final String second;

  final String? three;
  final String? four;

  Answer(
      {required this.rightOpinion,
      required this.fist,
      required this.second,
      this.three,
      this.four});

  List<String> qwestions() {
    List<String> list = [fist, second];

    if (three != null) {
      list.add(three!);
    }

    if (four != null) {
      list.add(four!);
    }

    return list;
  }
}
