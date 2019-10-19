import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/utils/auth_utils.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


 int currentUserRank;

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  List<User> users = List<User>();

  FirestoreUtils _firestoreUtils = new FirestoreUtils();
  @override
  Future initState() {
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
      body: new FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: <Widget>[
                new Container(
                  height: 220.0,
                  color: Colors.blue[400],
                  // color: Color.fromRGBO(58, 66, 86, .9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 22.0),
                        child: Text(
                          '$currentUserRank',
                          style: TextStyle(fontSize: 32.0, color: Colors.white),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(snapshot.data.photoUrl),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 22.0),
                        child: Text(
                          '2nd',
                          style: TextStyle(fontSize: 32.0, color: Colors.white),
                        ),
                      ),
                      // new Text('81pt'),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      // if(snapshot.data. == users[index])
                   
                      return LeaderCard(
                        mUser: users[index],
                        index: index,
                      );
                    },
                    itemCount: users.length,
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class LeaderCard extends StatelessWidget {
  const LeaderCard({Key key, @required this.mUser, @required this.index})
      : super(key: key);

  final User mUser;
  final int index;

  @override
  Widget build(BuildContext context) {
  
    return new Card(
      elevation: 5.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              '${index + 1}',
              style: TextStyle(fontSize: 14.0),
            ),
            new CircleAvatar(
              backgroundImage: NetworkImage(mUser.profileLink),
              radius: 28.0,
            ),
            new Text(
              mUser.name,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
            ),
            new Row(
              children: <Widget>[
                Icon(MdiIcons.coin, color: Colors.yellow[600]),
                Text(
                  '${mUser.point}',
                  style: TextStyle(fontSize: 14.0),
                )
              ],

              // '500pt',
              // style: TextStyle(fontSize: 14.0,color: Colors.yellow[800]),
            )
          ],
        ),
      ),
    );
  }
}
