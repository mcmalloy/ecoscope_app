import 'package:flutter/material.dart';
import 'package:ecoscope_app/pages/login_page.dart';
import 'package:pie_chart/pie_chart.dart';
class HeatMonitoringTab extends StatefulWidget{
  @override
  State createState() => new MonitorTab();
}

class MonitorTab extends State<HeatMonitoringTab> {
  @override

  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Lighting", () => 4);
    dataMap.putIfAbsent("Appliances", () => 6);
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