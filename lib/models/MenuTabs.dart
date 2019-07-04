import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/ProfileTab.dart';
import 'package:ecoscope_app/pages/ElectricityMonitoringTab.dart';
import 'package:ecoscope_app/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';

class MenuTabs extends StatefulWidget {
  MenuTabs({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  State createState() => new MenuTabsState();
}

class MenuTabsState extends State<MenuTabs>{

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            // This removes the back button so that you can only reach the login page by logging out.
            actions: <Widget>[
              new IconButton(
                icon: new Icon(null),
              ),
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: _signOut)
            ],
            leading: new Container(),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.account_box),text: "Profile",),
                Tab(icon: Icon(Icons.highlight),text: "Electricity Usage",)
              ],
            ),
          ),

          body: new TabBarView(
            children:<Widget>[ // Each child is the content for each of the 3 tabs.
              new ProfileTab(),
              new ElectricityMonitoringTab(),
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

