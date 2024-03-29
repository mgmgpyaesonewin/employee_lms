import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/main/main_page.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:employee_lms/utils/const.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FireAuth _fireAuth = FireAuth();
  FirestoreUtils _firestoreUtils = new FirestoreUtils();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          roundedRectButton("Google", signInGradients, false),
          roundedRectButton("Facebook", signUpGradients, false),
        ],
      ),
    );
  }

  Widget roundedRectButton(
      String title, List<Color> gradient, bool isEndIconVisible) {
    return Builder(builder: (BuildContext mContext) {
      return GestureDetector(
        onTap: () {
          _fireAuth.loginIn().then((FirebaseUser user) {
            debugPrint('${user.displayName}');
            _firestoreUtils.uploadUser(user);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(user: user),
              ),
            );
          }).catchError((e) => print(e));
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Stack(
            alignment: Alignment(1.0, 0.0),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(mContext).size.width / 1.2,
                decoration: ShapeDecoration(
                  color: title == "Facebook" ? Colors.blue : Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  // gradient: LinearGradient(
                  //     colors: gradient,
                  //     begin: Alignment.topLeft,
                  //     end: Alignment.bottomRight),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      title == "Facebook" ? MdiIcons.facebook : MdiIcons.google,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
                padding: EdgeInsets.only(top: 16, bottom: 16),
              ),
              Visibility(
                visible: isEndIconVisible,
                child: Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: ImageIcon(
                      AssetImage("assets/ic_forward.png"),
                      size: 30,
                      color: Colors.white,
                    )),
              ),
            ],
          ),
        ),
      );
    });
  }
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
