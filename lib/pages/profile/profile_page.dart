import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/pages/login/login_page.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class PeoplePage extends StatefulWidget {
  @override
  _PeoplePageState createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  FireAuth _fireAuth = new FireAuth();
  FirestoreUtils _firestoreUtils = new FirestoreUtils();
  String currentUserId;

  @override
  void initState() {
    super.initState();

    _fireAuth.getCurrentUserId().then((userId) => currentUserId = userId);

    // _firestoreUtils.getPointRewardForUsers()
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return new Stack(
      children: <Widget>[
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
          body: new FutureBuilder<FirebaseUser>(
            future: FirebaseAuth.instance.currentUser(),
            builder:
                (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                debugPrint('${snapshot.data}');
                return new Center(
                  child: new Column(
                    children: <Widget>[
                      new SizedBox(
                        height: _height / 12,
                      ),
                      new CircleAvatar(
                        radius: _width < _height ? _width / 4 : _height / 4,
                        backgroundImage: NetworkImage(snapshot.data.photoUrl),
                      ),
                      new SizedBox(
                        height: _height / 25.0,
                      ),
                      new Text(
                        '${snapshot.data.displayName}',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: _width / 15,
                            color: Colors.black),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(
                            top: _height / 30,
                            left: _width / 8,
                            right: _width / 8),
                        child: new Text(
                          'Snowboarder, Superhero and writer. ',
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
                          new Expanded(
                              child: new Column(
                            children: <Widget>[
                              new Text(
                                '26',
                                style: new TextStyle(color: Colors.black),
                              ),
                              new Text("QUIZ",
                                  style: new TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.normal))
                            ],
                          )),

                          new Expanded(
                              child: new Column(
                            children: <Widget>[
                              new Text(
                                '150',
                                style: new TextStyle(color: Colors.black),
                              ),
                              new Text("Rewards",
                                  style: new TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.normal))
                            ],
                          )),
                          // rowCell(343, 'QUIZ', snapshot.data.uid,context),
                          // rowCell(456, 'POINTS', snapshot.data.uid,context),
                        ],
                      ),
                      new Divider(height: _height / 30, color: Colors.white),
                      new Padding(
                        padding: new EdgeInsets.only(
                            left: _width / 8, right: _width / 8),
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(
                            left: _width / 8, right: _width / 8),
                        child: new FlatButton(
                          onPressed: () {
                            // getPointForUser(snapshot.data.uid);
                            _firestoreUtils
                                .getPointRewardForUsers(snapshot.data.uid);

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
                          color: Colors.blue[400],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: new CircularProgressIndicator());
              }
            },
          ),
          // body:
        )
      ],
    );
  }

 

  // getPointForUser(String userId) async {
  //   debugPrint('efrw'  _firestoreUtils.getPointRewardForUsers(userId));
  // }
}
