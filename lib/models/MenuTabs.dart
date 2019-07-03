import 'package:flutter/material.dart';

//next level
import 'package:ecoscope_app/pages/ProfileTab.dart';
import 'package:ecoscope_app/pages/ElectricityMonitoringTab.dart';
class MenuTabs extends StatelessWidget {
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
              new ProfilTab(),
              new ElectricityMonitoringTab(),
            ],
          )),

        );
  }
}

