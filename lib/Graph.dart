import 'HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget {
  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graph> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 1,
        child: LineChart(
          graphData()),

      ),
    );
  }

  LineChartData graphData(){
        return LineChartData(
          
        );
  }
}
