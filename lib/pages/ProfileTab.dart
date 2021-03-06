import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/login_page.dart';

class ProfilTab extends StatefulWidget {
  @override
  State createState() => new ProfileTabst();
}



class ProfileTabst extends State<ProfilTab> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Stack(
      children: <Widget>[
        ClipPath(
            child: Container(
              color: Colors.blue.withOpacity(0.8),
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

                SizedBox(height: 20.0),
                Text(
                  'default User',
                  style: TextStyle(
                    fontSize: 23.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Email: placeholderEmail',
                  style: TextStyle(
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),

                SizedBox(
                  height: 40.0,
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: 55,
                  width: 150,
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    shadowColor: Colors.lightGreen,
                    color: Colors.lightGreen,
                    elevation: 6.2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'home');
                      },
                      child: Center(
                        child: Text(
                          'logout',
                          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
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
