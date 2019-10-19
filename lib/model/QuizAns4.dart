class QuizAns4 {
  final bool ans;
  final String choice;

  QuizAns4(this.ans, this.choice);

  QuizAns4.fromJson(Map<String, dynamic> json)
      : assert(json['ans'] != null),
        assert(json['choc'] != null),
        ans = json['ans'],
        choice = json['choc'];

  Map<String, dynamic> toMap() => {
        'ans': ans,
        'choc': choice,
      };
}
