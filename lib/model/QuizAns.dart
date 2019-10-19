class QuizAns {
  final bool ans;
  final String choice;

  QuizAns({this.ans, this.choice});

  factory QuizAns.fromJson(Map<String, dynamic> parsedJson) {
    return QuizAns(ans: parsedJson['ans'], choice: parsedJson['choc']);
  }

  Map<String, dynamic> toMap() => {
        'ans': ans,
        'choc': choice,
      };
}
