import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/pages/login/login_ui.dart';
import 'package:employee_lms/pages/main_page.dart';
import 'package:employee_lms/pages/splash_screen.dart';
import 'package:employee_lms/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.lightPrimary,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: Constants.lightTheme,
      home: _handleCurrentScreen,
    );
  }

  Widget get _handleCurrentScreen {
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return new SplashScreen();
          } else {
            if (snapshot.hasData) {
              return MainPage(user: snapshot.data);
            }
            return new LoginPage();
          }
        });
  }
}
