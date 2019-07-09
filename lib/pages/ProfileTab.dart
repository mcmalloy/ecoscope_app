import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/login_page.dart';
import 'package:ecoscope_app/services/authentication.dart';

class ProfileTab extends StatefulWidget {
  ProfileTab({Key key, this.auth, this.userId, this.onSignedOut})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;
  @override
  State createState() => new ProfileTabstate();
}

class ProfileTabstate extends State<ProfileTab>{
  ProfileTabstate({Key key, this.auth, this.userId, this.onSignedOut});

  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String userId;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      children: <Widget>[
        ClipPath(
            child: Container(
              color: Colors.lightGreen.withOpacity(0.7),
            ),
            clipper: getClipper()),
        Positioned(
            width: 350,
            left: 25,
            top: MediaQuery.of(context).size.height / 5,
            child: Column(
              children: <Widget>[
                //profilbillede
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage("assets/default-user-image.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75))),
                ),
                SizedBox(height: 10.0),
                Text(
                  'User name goes here',
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.auth.getCurrentEmail(),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
           new RaisedButton(
             child:
            const Text('Add a new power source'),
            color: Theme.
            of(context).accentColor,
            elevation: 4.0,
            splashColor: Colors.
            blueGrey,
            onPressed: () {
              // Perform some action

            },
          )
              ],
            ))
      ],
    );
  }

}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
