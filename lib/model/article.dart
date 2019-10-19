import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/QuizAns1.dart';
import 'package:employee_lms/model/QuizAns4.dart';
// import 'package:employee_lms/model/QuizAns3.dart';
// import 'package:employee_lms/model/QuizAns2.dart';

// class Article {
//   final String title;
//   final DateTime postedDate;
//   final String question;
//   final String body;
//   final QuizAns1 quizAns1;
//   final QuizAns2 quizAns2;
//   final QuizAns3 quizAns3;
//   final QuizAns4 quizAns4;

//   Article(this.title, this.body, this.postedDate, this.question, this.quizAns1,
//       this.quizAns2, this.quizAns3, this.quizAns4);

//   Article.fromJson(Map<String, dynamic> json)
//       : assert(json['title'] != null),
//         assert(json['created_at'] != null),
//         assert(json['body'] != null),
//         assert(json['question'] != null),
//         assert(json['c_one'] != null),
//         assert(json['c_two'] != null),
//         assert(json['c_three'] != null),
//         assert(json['c_four'] != null),
//         title = json['title'],
//         postedDate = json['created_at'].toDate(),
//         body = json['body'],
//         question = json['question'],
//         quizAns1 = QuizAns1.fromJson(json['c_one']),
//         quizAns2 =  QuizAns2.fromJson(json['c_two']),
//         quizAns3 =  QuizAns3.fromJson(json['c_three']),
//         quizAns4 =  QuizAns4.fromJson(json['c_four']);

//   Article.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromJson(snapshot.data);

//           // property: Property.fromJson(parsedJson['property'])

// }
