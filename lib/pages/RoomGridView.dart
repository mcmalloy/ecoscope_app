
import 'package:ecoscope_app/models/UsageTabs.dart';
import 'package:ecoscope_app/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room_Grid extends StatefulWidget{
  @override
  State createState() => new Room_GridState();

}

class Room_GridState extends State<Room_Grid>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Rooms')
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          children: <Widget>[
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
            },
              child: Text(
                  'Room 1',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Room 2',
                  style: TextStyle(fontSize: 20)
              ),
            ),

            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Room 3',
                  style: TextStyle(fontSize: 20)
              ),
            ),

            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Room 4',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Room 5',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Room 6',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Lobby',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Kitchen',
                  style: TextStyle(fontSize: 20)
              ),
            ),
            RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
              },
              child: Text(
                  'Restaurant',
                  style: TextStyle(fontSize: 20)
              ),
            ),

          ]
        ),
      )
    );
  }

}