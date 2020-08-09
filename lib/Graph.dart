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

  double minY;
  double maxY;
  double maxX;

  @override
  void initState() {
    super.initState();
    minY = 60;
    maxY = 100;
  }

  //Function to create the Spots from scratch using the weight list
  List<FlSpot> _updateSta() {
    final fSpots = <FlSpot>[];
    if (widget.wt.isNotEmpty) {
      for (int i = 0; i < widget.wt.length; i++) {
        double val = double.parse(widget.wt[i]);

        fSpots.add(FlSpot((i.toDouble()), val));
        if (i == 0) {
          minY = (val - 20).roundToDouble();
          maxY = (val + 20).roundToDouble();
        }
        if (val > maxY)
          maxY = val + 5;
        else if (val < minY) minY = val - 5;
        maxX = widget.wt.length.toDouble() - 1;
        //Updates X-axis according to input instead of standard 7 data
      }
      return fSpots;
    } else
      return [FlSpot(0, 0)]; //Placeholder until the user inputs the weight
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
      axisTitleData: FlAxisTitleData(
        leftTitle: AxisTitle(
            showTitle: true,
            titleText: "(Kg)",
            reservedSize: 5,
            margin: 0,
            textStyle: TextStyle(color: Colors.black, fontSize: 15),
            textAlign: TextAlign.end),
      ),
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
          //  showingIndicators: showIndexes,
          isCurved: true,
          colors: gradientColors,
          barWidth: 1,
          isStrokeCapRound: true,
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
      minX: 0,
      maxX: maxX,
      minY: minY,
      maxY: maxY,
    );
  }
}
