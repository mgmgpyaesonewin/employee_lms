import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/article.dart';
import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Stream<List<Article>> getArticle() {
    // var articleList = new List<Article>();
    var collectionRef = firestore.collection('posts');

    collectionRef.getDocuments().then((QuerySnapshot querySnapshot) {
      debugPrint('${querySnapshot.documents.length}');
      querySnapshot.documents.map((_) {
        debugPrint('erewr');
      });
    });

    // return articleList;
  }

  Future<List<User>> getUserListPoint() async {
    var userList = List<User>();

    var query =
        firestore.collection('flutterusers').orderBy('point', descending: true);
    await query.getDocuments().then((QuerySnapshot querySnapshot) {
      querySnapshot.documents.map((DocumentSnapshot documentSnapshot) {
        userList.add(User.fromMap(documentSnapshot.data));
      }).toList();
    });

    return userList;
  }

  getPointRewardForUsers(String userId) async {
   QuerySnapshot userQuery = await Firestore.instance.collection('flutterusers').where('userId', isEqualTo: userId)
    .getDocuments();
    debugPrint('${userQuery.documents[0]['point']}');
    // return userQuery.documents[0]['point'];
  }

  Future<void> uploadUser(FirebaseUser cuUser) async {
    DocumentReference ref =
        firestore.collection('flutterusers').document(cuUser.uid);
    var user = User(
        cuUser.displayName, cuUser.email, cuUser.photoUrl, cuUser.uid,
        point: 0);
    await ref.get().then((DocumentSnapshot snapShot) {
      if (!snapShot.exists) {
        ref.setData(user.toMap());
      }
    });
  }
}
