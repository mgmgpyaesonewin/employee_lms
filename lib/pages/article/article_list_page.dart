import 'package:employee_lms/model/article.dart';
import 'package:employee_lms/model/user.dart';
import 'package:employee_lms/utils/firestore_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArticleListPage extends StatefulWidget {
  @override
  _ArticleListPageState createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  FirestoreUtils _firestoreUtils = new FirestoreUtils();

  final dateFormat = DateFormat("EEEE, d");

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<List<Article>>(
      stream: Stream.fromFuture(_firestoreUtils.getArticle()),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        return _buildList(context, snapshot.data);
      },
    );
  }

  Widget _buildList(BuildContext context, List<Article> snapshot) {
    return ListView(
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Article article) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/articledetail');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Container(
          height: 180.0,
          child: Card(
            elevation: 6.0,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          article.title,
                          maxLines: 1,
                        ),
                      ),
                      subtitle: Text(article.body,
                          maxLines: 3, style: TextStyle(fontSize: 16.0)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.keyboard_arrow_right, size: 40.0)
                        ],
                      )),
                ),
                new Divider(
                  color: Colors.blue,
                  thickness: 0.8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    '${DateTime.now()}',
                    style: TextStyle(fontSize: 14.0),
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
            // child: Column(
            //              chil,
            // ),
          ),
        ),
      ),
    );
  }
}
