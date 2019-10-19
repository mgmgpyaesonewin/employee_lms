import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String readTimestamp(DateTime timestamp) {
  debugPrint('$timestamp eafewf');

  return '${timestamp.day}/' + '${timestamp.month}/' + '${timestamp.year}';
}

class ArticalDetailPage extends StatefulWidget {
  final DocumentSnapshot article;
  ArticalDetailPage({Key key, this.article}) : super(key: key);
  @override
  _ArticalDetailPageState createState() => _ArticalDetailPageState();
}

class _ArticalDetailPageState extends State<ArticalDetailPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(58, 66, 86, .9),
      statusBarIconBrightness: Brightness.light,
    ));

    final topContentText = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 120.0),
        Text(
          widget.article['title'],
          style: TextStyle(color: Colors.white, fontSize: 35.0),
        ),
        SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Icon(
                      MdiIcons.tag,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      '${readTimestamp(widget.article['created_at'])}',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )),
          ],
        ),
      ],
    );

    final topContent = Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage("https://picsum.photos/250?image=9"),
                fit: BoxFit.cover,
              ),
            )),
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: EdgeInsets.only(top: 40.0, left: 40.0, right: 40.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
          child: Center(
            child: topContentText,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 20.0,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.white),
          ),
        )
      ],
    );

    final bottomContentText = Text(
      "Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.Consectetur sit sit ea qui commodo occaecat id pariatur.",
      style: TextStyle(fontSize: 18.0),
    );
    final readButton = Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
          onPressed: () => _openDialog(context).then((value) {
            debugPrint('$value');
          }),
          color: Color.fromRGBO(58, 66, 86, 1.0),
          child:
              Text("TAKE THIS LESSON", style: TextStyle(color: Colors.white)),
        ));
    final bottomContent = Container(
      width: MediaQuery.of(context).size.width,
      padding:
          EdgeInsets.only(top: 40.0, bottom: 40.0, left: 10.0, right: 10.0),
      child: Center(
        child: Column(
          children: <Widget>[bottomContentText, readButton],
        ),
      ),
    );

    return Scaffold(
      body: ListView(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }

  Future<bool> _openDialog(BuildContext context) {
    bool _correctAns = false;
    return showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('${widget.article['question']}'),
            content: Container(
              width: 350.0,
              height: 350.0,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15.0),
                  MaterialButton(
                    color: _correctAns ? Colors.green : null,
                    child: Text('${widget.article['quiz'][0]['choc']}'),
                    minWidth: 250.0,
                    onPressed: () {
                      if (widget.article['quiz'][0]['ans'] == "true") {
                        setState(() {
                          _correctAns = true;
                        });

                        // Future.delayed(Duration(seconds: 3)).then((_) {
                        //   Navigator.of(context).pop(true);
                        // });
                      } else {
                        setState(() {
                          _correctAns = false;
                        });
                      }
                      // return Future.value(false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                        side:
                            BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0))),
                  ),
                  SizedBox(height: 8.0),
                  MaterialButton(
                    color: _correctAns ? Colors.green : null,
                    child: Text('${widget.article['quiz'][1]['choc']}'),
                    minWidth: 250.0,
                    onPressed: () {
                      if (widget.article['quiz'][1]['ans'] == "true") {
                        setState(() {
                          _correctAns = true;
                        });
                        Future.delayed(Duration(seconds: 3));

                        Navigator.of(context).pop(true);
                      } else {
                        Navigator.of(context).pop(false);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                        side:
                            BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0))),
                  ),
                  SizedBox(height: 8.0),
                  MaterialButton(
                    color: _correctAns ? Colors.green : null,
                    child: Text('${widget.article['quiz'][2]['choc']}'),
                    minWidth: 250.0,
                    onPressed: () {
                      if (widget.article['quiz'][2]['ans'] == "true") {
                        setState(() {
                          _correctAns = true;
                        });
                        Future.delayed(Duration(seconds: 3));

                        Navigator.of(context).pop(true);
                      } else {
                        Navigator.of(context).pop(false);
                      }

                      // Navigator.pop(context);

                      // return Future.value(false);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                        side:
                            BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0))),
                  ),
                  SizedBox(height: 8.0),
                  MaterialButton(
                    color: _correctAns ? Colors.green : null,
                    child: Text('${widget.article['quiz'][3]['choc']}'),
                    minWidth: 250.0,
                    onPressed: () {
                      if (widget.article['quiz'][3]['ans'] == "true") {
                        setState(() {
                          _correctAns = true;
                        });
                        Future.delayed(Duration(seconds: 3));

                        Navigator.of(context).pop(true);
                      } else {
                        Navigator.of(context).pop(false);
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(0.0),
                        side:
                            BorderSide(color: Color.fromRGBO(58, 66, 86, 1.0))),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          );
        });
  }
}