import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// ignore: must_be_immutable
class Graph extends StatefulWidget {
  var wt = <String>[];
  Graph(this.wt);

  @override
  GraphState createState() => GraphState();
}

class GraphState extends State<Graph> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  final fSpots = <FlSpot>[];

  //Function to create the Spots from scratch using the weight list
  List<FlSpot> _updateSta() {
    fSpots.clear(); //Clearing to avoid overlap of the list
    if (widget.wt.isNotEmpty) {
      for (int i = 0; i < widget.wt.length; i++) {
        fSpots.add(FlSpot((i.toDouble()), double.parse(widget.wt[i])));
      }
      return fSpots;
    } else
      return [FlSpot(1, 89)]; //Placeholder until the user inputs the weight
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 1,
        child: LineChart(graphData()),
      ),
    );
  }

  LineChartData graphData() {
    return LineChartData(
      clipData: FlClipData.all(),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),

          ///Leaving this here to understand the format to edit the X-axis later
          //getTitles: (value) {},

//                  case 1:
//                    return 'MA;
//                  case 5:
//                    return 'JUN';
//                  case 8:
//                    return 'SEP';
//                  case 10:
//                    return 'OCT';
//                }
//                return '';
//              },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          reservedSize: 22,
          margin: 6,
          interval: 5,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 60,
      maxY: 100,
      lineBarsData: [
        LineChartBarData(
          spots: _updateSta(),
          //          spots: [
//            FlSpot(0, 90),
//            FlSpot(1, 80),
//            FlSpot(2, 70),
//            FlSpot(3, 78),
//            FlSpot(4, 86),
//            FlSpot(5, 64),
//            FlSpot(6, 70),
//          ],

          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: false,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
