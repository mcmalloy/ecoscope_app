import 'package:flutter/material.dart';

class DashboardTab extends StatefulWidget {
  @override
  _DashboardTabState createState() => _DashboardTabState();
}

class _DashboardTabState extends State<DashboardTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Flexible(
          flex: 2,
          child: topDashBoardWidgets(),
        ),
        SizedBox(
          height: 32,
        ),
        Flexible(
          flex: 3,
          child: centerDashBoardWidget(),
        )
      ],
    );
  }

  Widget topDashBoardWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 180,
          width: 140,
          child: Container(
            decoration: customBoxShape(Colors.green, Colors.lightGreenAccent)
          ),
        ),
        SizedBox(
          width: 25,
        ),
        SizedBox(
          height: 200,
          width: 200,
          child: Container(
            decoration: customBoxShape(Colors.red, Colors.orange),
          ),
        ),
      ],
    );
  }

    customBoxShape(Color color1, Color color2){
    return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [color1,color2],
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(8)));
  }

  Widget centerDashBoardWidget() {
    return Container(
      height: 180,
      width: 320,
      decoration: customBoxShape(Colors.purple,Colors.purpleAccent)
    );
  }
}
