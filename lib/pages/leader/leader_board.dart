import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<User> users = List<User>();

  FirestoreUtils _firestoreUtils = new FirestoreUtils();

  @override
  void initState() {
    super.initState();
    _firestoreUtils.getUserListPoint().then((userList) {
      setState(() {
        users = userList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leader Board'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          debugPrint('${users.length}');
          return GestureDetector(
            onTap: (){
              _firestoreUtils.getPointRewardForUsers(users[index].userId);
            },
                      child: Card(
              
                elevation: 5.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Container(
                  height: 90.0,
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(users[index].profileLink),
                      radius: 28.0,
                    ),
                    title: Text(
                      users[index].name,
                      style:
                          TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(MdiIcons.coin, color: Colors.yellow[600]),
                        Text(
                          '${users[index].point}',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
