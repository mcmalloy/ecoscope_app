
import 'package:ecoscope_app/models/UsageTabs.dart';
import 'package:ecoscope_app/objects/HotelObject.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
class Room_Grid extends StatefulWidget{
  @override
  State createState() => new Room_GridState();

}

class Room_GridState extends State<Room_Grid>{
  int tid = 300;
  List<HotelObject> ree = new List();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Theme.of(context).accentColor ,
        title: Text('Rooms')
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: AnimationLimiter(
          child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: <Widget>[
                AnimationConfiguration.staggeredGrid(
                  position: 1,
                  columnCount: 1,
                  duration: Duration(milliseconds: tid),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                        },
                        child: Text(
                            'Room 1',
                            style: TextStyle(fontSize: 20)
                        ),
                      ),),
                    ),
                  ),
                AnimationConfiguration.staggeredGrid(
                  position: 1,
                  columnCount: 1,
                  duration: Duration(milliseconds: tid),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: ScaleAnimation(
                      child: RaisedButton(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                  },
                  child: Text(
                      'Room 2',
                      style: TextStyle(fontSize: 20)
                  ),
                ),
        ),
      )
    ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Colors.amberAccent,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Room 3',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Room 4',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Room 5',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Colors.redAccent,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Room 6',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Lobby',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Colors.amberAccent,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Kitchen',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),
                AnimationConfiguration.staggeredGrid(
                    position: 1,
                    columnCount: 1,
                    duration: Duration(milliseconds: tid),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: ScaleAnimation(
                        child: RaisedButton(
                          color: Theme.of(context).accentColor,
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => UsageTabs()));
                          },
                          child: Text(
                              'Restaurant',
                              style: TextStyle(fontSize: 20)
                          ),
                        ),
                      ),
                    )
                ),

              ]
          ),
        )
      )
    );
  }

}
