import 'package:employee_lms/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'login/login_page.dart';

class PeoplePage extends StatefulWidget {
 

  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  FireAuth _fireAuth = new FireAuth();
  FirebaseUser mCurrentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        mCurrentUser = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return new Stack(
      children: <Widget>[
       
        new Image.network(
          mCurrentUser.photoUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
            filter: new ui.ImageFilter.blur(
              sigmaX: 6.0,
              sigmaY: 6.0,
            ),
            child: new Container(
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),
            )),
        new Scaffold(
            appBar: new AppBar(
              title: new Text("Profile"),
              centerTitle: false,
              elevation: 0.0,
              backgroundColor: Colors.white,
            ),
            backgroundColor: Colors.white,
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new SizedBox(
                    height: _height / 12,
                  ),
                  new CircleAvatar(
                    radius: _width < _height ? _width / 4 : _height / 4,
                    backgroundImage: NetworkImage(mCurrentUser.photoUrl),
                  ),
                  new SizedBox(
                    height: _height / 25.0,
                  ),
                  new Text(
                    '${mCurrentUser.displayName}',
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: _width / 15,
                        color: Colors.black),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        top: _height / 30, left: _width / 8, right: _width / 8),
                    child: new Text(
                      'Snowboarder, Superhero and writer.\nSometime I work at google as Executive Chairman ',
                      style: new TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: _width / 25,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Divider(
                    height: _height / 30,
                    color: Colors.white,
                  ),
                  new Row(
                    children: <Widget>[
                      rowCell(343, 'POSTS'),
                      rowCell(673826, 'FOLLOWERS'),
                      rowCell(275, 'FOLLOWING'),
                    ],
                  ),
                  new Divider(height: _height / 30, color: Colors.white),
                  new Padding(
                    padding: new EdgeInsets.only(
                        left: _width / 8, right: _width / 8),
                    child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.person),
                          new SizedBox(
                            width: _width / 30,
                          ),
                          new Text('FOLLOW')
                        ],
                      )),
                      color: Colors.blue[50],
                    ),
                  ),
                  new Padding(
                    padding: new EdgeInsets.only(
                        left: _width / 8, right: _width / 8),
                    child: new FlatButton(
                      onPressed: () {
                        _fireAuth.signOut().then((_) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        }).catchError((e) => print(e));
                      },
                      child: new Container(
                          child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.person),
                          new SizedBox(
                            width: _width / 30,
                          ),
                          new Text('Log out')
                        ],
                      )),
                      color: Colors.blue[50],
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget rowCell(int count, String type) => new Expanded(
          child: new Column(
        children: <Widget>[
          new Text(
            '$count',
            style: new TextStyle(color: Colors.black),
          ),
          new Text(type,
              style: new TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.normal))
        ],
      ));
}
