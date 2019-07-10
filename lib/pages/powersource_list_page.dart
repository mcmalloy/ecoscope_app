import 'dart:core' as prefix0;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:ecoscope_app/services/authentication.dart';

class PowerSourceListPage extends StatefulWidget{
  PowerSourceListPage({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  State createState() => new _PowerSourceListState();
}

class _PowerSourceListState extends State<PowerSourceListPage>{
  _PowerSourceListState({Key key, this.auth, this.userId, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  Widget build(BuildContext context) {
    final title = 'Basic List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
          ],
        ),
      ),
    );
  }
}