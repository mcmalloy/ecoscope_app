import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/login_page.dart';
import 'package:pie_chart/pie_chart.dart';
class WaterMonitoringTab extends StatefulWidget{
  @override
  State createState() => new WaterMonitorTab();
}

class WaterMonitorTab extends State<WaterMonitoringTab> {
  @override

  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Shower", () => 4);
    dataMap.putIfAbsent("Bath", () => 2);
    dataMap.putIfAbsent("Sinks", () => 1);
    dataMap.putIfAbsent("Kitchen", () => 2);
    // TODO: implement build
    return PieChart(dataMap: dataMap,
      legendFontColor: Colors.blueGrey[900],
      legendFontSize: 14.0,
      legendFontWeight: FontWeight.w500,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: 32.0,
      chartRadius: MediaQuery
          .of(context)
          .size
          .width / 2.7,
      showChartValuesInPercentage: true,
      showChartValues: true,
      chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),);
  }
}