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

  factory Answer.fromJson(Map<String, dynamic> json) {
    final int rightOpinion = json['rightOpinion'] ?? 0;
    final String fist = json['fist'] ?? "fist";
    final String second = json['second'] ?? "second";
    final String? three = json['three'];
    final String? four = json['four'];

    return Answer(
        fist: fist,
        second: second,
        rightOpinion: rightOpinion,
        three: three,
        four: four);
  }

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
