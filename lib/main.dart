import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/pages/login/login_ui.dart';
import 'package:employee_lms/pages/main/main_page.dart';
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
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    //   statusBarIconBrightness: Brightness.dark,
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        accentColor: Colors.blue,
        primaryColor: Colors.white,
      ),
      // theme: Constants.lightTheme,
      home: _handleCurrentScreen,
    );
  }

  Widget get _handleCurrentScreen {
    return new StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          } else {
            if (snapshot.hasData) {
              return MainPage();
            }
            return new LoginPage();
          }
        });
  }
}
