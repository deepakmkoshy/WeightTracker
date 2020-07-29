import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class Graph extends StatefulWidget {
  var wt = <String>[];
  Graph(this.wt);

//  var weight = <String>[];
//  Graph(List<String> weight);

  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final fSpots = <FlSpot>[];

  ///Initialising state to update FlSpots with the list values
  @override
  void initState() {
    super.initState();
    if (widget.wt.isNotEmpty) {
      for (int i = 0; i <= 6; i++) {
        fSpots[i] = FlSpot(i.toDouble(), double.parse(widget.wt[i]));
      }
    }
  }

  Widget _viewLis() {
    String tmp = '';
    if (widget.wt.isEmpty)
      return null;
    else {
      for (var text in widget.wt) {
        tmp = tmp + ' ' + text;
      }
      return Text(
        tmp,
        style: Theme.of(context).textTheme.headline5,
      );
    }
  }

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: _viewLis(),

    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: AspectRatio(
//        aspectRatio: 1,
//        child: LineChart(graphData()),
//      ),
//    );
//  }
//
//  LineChartData graphData() {
//    return LineChartData(
//      clipData: FlClipData.all(),
//      gridData: FlGridData(
//        show: true,
//        drawVerticalLine: false,
//        drawHorizontalLine: false,
//        getDrawingHorizontalLine: (value) {
//          return FlLine(
//            color: const Color(0xff37434d),
//            strokeWidth: 1,
//          );
//        },
//        getDrawingVerticalLine: (value) {
//          return FlLine(
//            color: const Color(0xff37434d),
//            strokeWidth: 1,
//          );
//        },
//      ),
//      titlesData: FlTitlesData(
//        show: true,
//        bottomTitles: SideTitles(
//          showTitles: true,
//          reservedSize: 22,
//          textStyle: const TextStyle(
//              color: Color(0xff68737d),
//              fontWeight: FontWeight.bold,
//              fontSize: 16),
//          //getTitles: (value) {},
//
////                  case 1:
////                    return 'MA;
////                  case 5:
////                    return 'JUN';
////                  case 8:
////                    return 'SEP';
////                  case 10:
////                    return 'OCT';
////                }
////                return '';
////              },
//          margin: 8,
//        ),
//        leftTitles: SideTitles(
//          showTitles: true,
//          textStyle: const TextStyle(
//            color: Color(0xff67727d),
//            fontWeight: FontWeight.bold,
//            fontSize: 15,
//          ),
//          reservedSize: 22,
//          margin: 6,
//          interval: 5,
//        ),
//      ),
//      borderData: FlBorderData(
//          show: true,
//          border: Border.all(color: const Color(0xff37434d), width: 1)),
//      minX: 0,
//      maxX: 6,
//      minY: 60,
//      maxY: 100,
//      lineBarsData: [
//        LineChartBarData(
//          spots: fSpots.isNotEmpty ? fSpots : [FlSpot(0, 89)],
//          // spots: fSpots,
////          spots: [
////            FlSpot(0, 90),
////            FlSpot(1, 80),
////            FlSpot(2, 70),
////            FlSpot(3, 78),
////            FlSpot(4, 86),
////            FlSpot(5, 64),
////            FlSpot(6, 70),
////          ],
//
//          isCurved: true,
//          colors: gradientColors,
//          barWidth: 5,
//          isStrokeCapRound: false,
//          dotData: FlDotData(
//            show: true,
//          ),
//          belowBarData: BarAreaData(
//            show: true,
//            colors:
//            gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//          ),
//        ),
//      ],
//    );
//  }
}

