import 'dart:async';

import 'package:employee_lms/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  static FireAuth _fireAuth;

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FireAuth._createInstance();

  factory FireAuth() {
    if (_fireAuth == null) {
      _fireAuth = FireAuth._createInstance();
    }
    return _fireAuth;
  }

  Future<FirebaseUser> loginIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
        idToken: gSA.idToken, accessToken: gSA.accessToken);

    print("User Name : ${user.displayName}");
    return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    googleSignIn.signOut();
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  // Future<FirebaseUser> getCurrentUser() async {
  //   FirebaseUser user;
  //   await FirebaseAuth.instance.currentUser().then((u) {
  //     user = u;
  //   });

  //   return user;
  // }
}
