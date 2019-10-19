import 'package:employee_lms/utils/auth_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  @override
  Future initState() {
    // TODO: implement initState
    super.initState();
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
                  height: 250.0,
                  color: Color.fromRGBO(58, 66, 86, .9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 22.0),
                        child: Text(
                          '2nd',
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
                  child: ListView(
                    children: <Widget>[
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                      new LeaderCard(mCurrentUser: snapshot.data),
                    ],
                  ),
                )
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class LeaderCard extends StatelessWidget {
  const LeaderCard({
    Key key,
    @required this.mCurrentUser,
  }) : super(key: key);

  final FirebaseUser mCurrentUser;

  @override
  Widget build(BuildContext context) {
    return new Card(
      elevation: 5.0,
      child: Container(
        margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(
              '1st',
              style: TextStyle(fontSize: 14.0),
            ),
            new CircleAvatar(
              backgroundImage: NetworkImage(mCurrentUser.photoUrl),
              radius: 28.0,
            ),
            new Text(
              mCurrentUser.displayName,
              style: TextStyle(fontSize: 16.0),
            ),
            new Text(
              '500pt',
              style: TextStyle(fontSize: 14.0),
            )
          ],
        ),
      ),
    );
  }
}
