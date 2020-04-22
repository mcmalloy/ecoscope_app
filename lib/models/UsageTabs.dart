import 'package:ecoscope_app/pages/tabs/HeatMonitoringTab.dart';
import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/tabs/ElectricityMonitoringTab.dart';
import 'package:ecoscope_app/pages/tabs/WaterMonitoringTab.dart';
import 'package:ecoscope_app/services/authentication.dart';

class UsageTabs extends StatefulWidget {
  UsageTabs({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  State createState() => new UsageTabsState(auth: auth,onSignedOut: onSignedOut,userId: userId);
}

class UsageTabsState extends State<UsageTabs>{
  UsageTabsState({Key key, this.auth, this.userId, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            // This removes the back button so that you can only reach the login page by logging out.
            actions: <Widget>[
              new IconButton(
                icon: new Icon(null),
              ),
              new FlatButton(
                  child: new Text('Go back to Rooms',
                      style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: (){
                    Navigator.pop(context);
                  })
            ],
            leading: new Container(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.highlight),text: "Electricity Usage",),
                Tab(icon: Icon(Icons.all_inclusive),text: "Water Usage"),
                Tab(icon: Icon(Icons.assessment),text: "Heat Usage",)
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new ElectricityMonitoringTab(),
              new WaterMonitoringTab(),
              new HeatMonitoringTab(),
            ],
          )),

    );
  }

  @override
  Widget LogoutButton(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter login demo'),
        actions: <Widget>[
          new FlatButton(
              child: new Text('Logout',
                  style: new TextStyle(fontSize: 17.0, color: Colors.white)),
              onPressed: _signOut)
        ],
      ),
    );
  }
  _signOut() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }
}

