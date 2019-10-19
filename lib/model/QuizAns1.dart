class QuizAns1 {
  final bool ans;
  final String choice;

  QuizAns1(this.ans, this.choice);

  QuizAns1.fromJson(Map<String, dynamic> json)
      : assert(json['ans'] != null),
        assert(json['choc'] != null),
        ans = json['ans'],
        choice = json['choc'];

  Map<String, dynamic> toMap() => {
        'ans': ans,
        'choc': choice,
      };
}
