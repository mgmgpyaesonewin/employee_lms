class QuizAns2{
  final bool ans;
  final String choice;


    QuizAns2(this.ans,this.choice);

    QuizAns2.fromJson(Map<String, dynamic> json)
      : assert(json['ans'] != null),
        assert(json['choc'] != null),
        ans = json['ans'],
        choice = json['choc'];

  Map<String, dynamic> toMap() => {
        'ans': ans,
        'choc': choice,
      };

  
}