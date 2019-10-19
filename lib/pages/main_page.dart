import 'package:employee_lms/pages/article/article_list_page.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/pages/profile_page.dart';
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
    ArticleListPage(),
    ArticleListPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PeoplePage(user: widget.user)));
            },
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage('${widget.user.photoUrl}'),
            ),
          ),
          SizedBox(width: 30.0,)
        ],
      ),
      body: _childWidget[_currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(accentColor: Colors.white, brightness: Brightness.dark),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onTap, // new
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.favorite),
              title: new Text('Favorite'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), title: Text('Profile'))
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
