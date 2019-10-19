import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/leader/leader_board.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/pages/profile/profile_page.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainPage extends StatefulWidget {
  final FirebaseUser user;

  const MainPage({Key key, this.user}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _childWidget = [
    ArticleListPage(),
    LeaderBoardPage(),
    PeoplePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childWidget[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(brightness: Brightness.light),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // fixedColor: Color.fromRGBO(58, 66, 86, .9),

          onTap: _onTap, // new
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Image.asset(
                'assets/image/content-writing.png',
                width: 30.0,
              ),
              title: new Text('Articles'),
            ),
            BottomNavigationBarItem(
              icon: new Image.asset(
              
                'assets/image/podium.png',
                width: 30.0,
              ),
              title: new Text('Leader Board'),
            ),
            BottomNavigationBarItem(
                icon: new Image.asset(
                  'assets/image/user.png',
                  width: 30.0,
                ),
                title: Text('Profile'))
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
