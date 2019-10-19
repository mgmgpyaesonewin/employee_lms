class QuizAns3{
  final bool ans;
  final String choice;

    QuizAns3(this.ans,this.choice);


    QuizAns3.fromJson(Map<String, dynamic> json)
      : assert(json['ans'] != null),
        assert(json['choc'] != null),
        ans = json['ans'],
        choice = json['choc'];

  Map<String, dynamic> toMap() => {
        'ans': ans,
        'choc': choice,
      };


  
}