import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/QuizAns.dart';

class Article {
  final String title;
  final String body;
  final Timestamp postedTime;
  final List<QuizAns> quizs;
  final String question;

  Article({this.title, this.body, this.postedTime, this.quizs, this.question});

   factory Article.fromJson(Map<String, dynamic> json) {
    var list = json['quiz'] as List;
    print(list.runtimeType);
    List<QuizAns> quizsList = list.map((i) => QuizAns.fromJson(i)).toList();

     return Article(
        title: json['title'],
        body: json['body'],
        postedTime: json['created_time'],
        question: json['question'],
        quizs: quizsList);
  }

  //  Article.fromJson(Map<String, dynamic> json)
  //     : assert(json['title'] != null),
  //       assert(json['created_at'] != null),
  //       assert(json['question'] != null),
  //       assert(json['created_at'] != null),
  //       assert(json['body'] != null),
  //       title = json['title'],
  //       postedTime = json['created_time'],
  //       question = json['question'],
  //       quizs = 
  //       body = json['body'];


  // Article.fromSnapshot(DocumentSnapshot snapshot):this.fromJson(snapshot.data);

  Map<String, dynamic> toMap() => {
        'title': title,
        'question': question,
        'created_at': postedTime,
        'body': body,
        'quiz':quizs
      };
}
