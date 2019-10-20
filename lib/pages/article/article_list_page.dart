import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:employee_lms/model/article.dart';
import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/pages/article/article_detail.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  FirestoreUtils _firestoreUtils = new FirestoreUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Article List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
      ),
      body: Container(
          margin: EdgeInsets.only(top: 10.0), child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('posts').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        return _buildList(context, snapshot.data.documents);
      },
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot article) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ArticalDetailPage(
                      article: article,
                    )),
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
          ),
          child: Container(
            height: 250.0,
            child: Card(
              elevation: 6.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Color(
                              (math.Random().nextDouble() * 0xFFFFFF).toInt() <<
                                  0)
                          .withOpacity(1.0),
                      child: Text(article['title'].toString()[0]),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        article['title'],
                        maxLines: 1,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                    subtitle: Text(article['body'],
                        maxLines: 3,
                        style: Theme.of(context).textTheme.subtitle),
                  ),
                  new Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      children: <Widget>[
                        Icon(MdiIcons.tag,size: 20.0,color: Colors.grey,),
                        SizedBox(width: 5.0),
                        Text(
                          ' Posted On  ${readTimestamp(article['created_at'])}',
                          style: TextStyle(fontSize: 14.0),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              // child: Column(
              //              chil,
              // ),
            ),
          ),
        ));
  }
}
