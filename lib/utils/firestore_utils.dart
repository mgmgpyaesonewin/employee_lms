import 'dart:core' as prefix0;
import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/article.dart';
import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUtils {
  static FirestoreUtils _firestoreUtils;

  final Firestore firestore = Firestore.instance;

  final FireAuth auth = FireAuth();

  String userId;

  factory FirestoreUtils() {
    if (_firestoreUtils == null) {
      _firestoreUtils = FirestoreUtils._createInstance();
    }
    return _firestoreUtils;
  }

  FirestoreUtils._createInstance();

  Future<List<Article>> getArticle() async {
    var articleList = new List<Article>();
    var collectionRef = firestore.collection('posts');
    await collectionRef.getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.map((DocumentSnapshot snapshot) {
        articleList.add(new Article.fromSnapshot(snapshot));
      }).toList();
    });

    return articleList;
  }

  Future<void> uploadUser(FirebaseUser cuUser) async {
    DocumentReference ref =
        firestore.collection('flutterusers').document(cuUser.uid);
    var user =
        User(cuUser.displayName, cuUser.email, cuUser.photoUrl, cuUser.uid);
    await ref.get().then((DocumentSnapshot snapShot) {
      if (!snapShot.exists) {
        ref.setData(user.toMap());
      }
    });
  }
}
