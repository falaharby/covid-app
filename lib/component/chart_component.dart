import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  List datas = [];

  LineChartSample2(this.datas);
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  List<FlSpot> dailySpot = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // loopData();
  }

  // loopData() {
  //   for (var i = 0; i < 29; i++) {
  //     dailySpot.add(FlSpot(i.toDouble(), widget.datas[30 - (i + 1)]));
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Color(0xFFCAFFB1)),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 18.0, top: 28, bottom: 10),
              child: LineChart(
                showAvg ? avgData() : mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 0.5,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.white,
            strokeWidth: 0.5,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 6),
          getTitles: (value) {
            return (value.toInt() + 1).toString();
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: false,
          getTextStyles: (value) => const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '50';
              case 3:
                return '100 jt';
              case 5:
                return '150 jt';
              case 7:
                return '200 jt';
              case 9:
                return '250 jt';
            }
            return '';
          },
          reservedSize: 10,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true, border: Border.all(color: Colors.white, width: 0.5)),
      minX: 0,
      maxX: 29,
      minY: 0,
      maxY: 10000,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, widget.datas[29]),
            FlSpot(1, widget.datas[28]),
            FlSpot(2, widget.datas[27]),
            FlSpot(3, widget.datas[26]),
            FlSpot(4, widget.datas[25]),
            FlSpot(5, widget.datas[24]),
            FlSpot(6, widget.datas[23]),
            FlSpot(7, widget.datas[22]),
            FlSpot(8, widget.datas[21]),
            FlSpot(9, widget.datas[20]),
            FlSpot(10, widget.datas[19]),
            FlSpot(11, widget.datas[18]),
            FlSpot(12, widget.datas[17]),
            FlSpot(13, widget.datas[16]),
            FlSpot(14, widget.datas[15]),
            FlSpot(15, widget.datas[14]),
            FlSpot(16, widget.datas[13]),
            FlSpot(17, widget.datas[12]),
            FlSpot(18, widget.datas[11]),
            FlSpot(19, widget.datas[10]),
            FlSpot(20, widget.datas[9]),
            FlSpot(21, widget.datas[8]),
            FlSpot(22, widget.datas[7]),
            FlSpot(23, widget.datas[6]),
            FlSpot(24, widget.datas[5]),
            FlSpot(25, widget.datas[4]),
            FlSpot(26, widget.datas[3]),
            FlSpot(27, widget.datas[2]),
            FlSpot(28, widget.datas[1]),
            FlSpot(29, widget.datas[0]),
          ],
          isCurved: true,
          colors: [Color(0xFF93D773)],
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
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

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'MAR';
              case 5:
                return 'JUN';
              case 8:
                return 'SEP';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10k';
              case 3:
                return '30k';
              case 5:
                return '50k';
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3.44),
            FlSpot(2.6, 3.44),
            FlSpot(4.9, 3.44),
            FlSpot(6.8, 3.44),
            FlSpot(8, 3.44),
            FlSpot(9.5, 3.44),
            FlSpot(11, 3.44),
          ],
          isCurved: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2),
          ],
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(show: true, colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.2)
                .withOpacity(0.1),
          ]),
        ),
      ],
    );
  }
}
