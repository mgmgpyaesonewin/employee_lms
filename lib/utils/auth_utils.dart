import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireAuth {
  static FireAuth _fireAuth;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FireAuth._createInstance();

  factory FireAuth() {
    if (_fireAuth == null) {
      _fireAuth = FireAuth._createInstance();
    }
    return _fireAuth;
  }

  Future<FirebaseUser> loginIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
    // GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    // GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    // FirebaseUser user = await _auth.signInWithGoogle(
    //     idToken: gSA.idToken, accessToken: gSA.accessToken);

    // print("User Name : ${user.displayName}");
    // return user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    _googleSignIn.signOut();
  }

  Future<String> getCurrentUser() async {
    String uid = '';
    await FirebaseAuth.instance.currentUser().then((user) {
      uid = user.uid;
    });

    return uid;
  }
}
