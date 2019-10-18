import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/utils/const.dart';
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
     theme: Constants.lightTheme,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ArticleListPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginPage(),
        // '/profile': (context) => MainPage(),
        // '/fourth': (context) => PeoplePage(),
        // '/article': (context) => ArticleList(),
        // '/articledetail': (context) => DetailPage(),
        // '/quizdialog':(context) => QuizDialog()
      },
      debugShowCheckedModeBanner: false,
      
    );
  }
}
