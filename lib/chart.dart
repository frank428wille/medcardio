import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'getbatimentos.dart';
import 'package:fit_kit/fit_kit.dart';
import 'main.dart';

// ignore: must_be_immutable
class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xFFFFCDD2),
    const Color(0xFFFF1744),
  ];

  LineChartSample2 createState() => LineChartSample2();

  bool showAvg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff232d37),
      appBar: AppBar(
        backgroundColor: Color(0xff37434d),
        title: Text('Medição Cardio', textAlign: TextAlign.center),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.70,
                child: Container(
                  decoration: const BoxDecoration(color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child: LineChart(
                      mainData(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Card(
            color: Color(0xff232d37),
            elevation: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff37434d),
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          'Média Batimentos: ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '${results[0].value}',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          'Condição: ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            '$condi',
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              color: Colors.red,
              textColor: Colors.white,
              child: Text('SAIR'),
              onPressed: () {
                _navigateToSubPage(context);
                revokePermissions();
                //readAll();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Read'),
                onPressed: () {
                  showAlertDialog1(context);
                  read();
                }),
          ),
        ],
      ),
    );
  }

  Future _navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
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
              case 0:
                return '0';
              case 4:
                return '4';
              case 8:
                return '8';
              case 12:
                return '12';
              case 16:
                return '16';
              case 20:
                return '20';
              case 24:
                return '24';
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
              case 10:
                return '10';
              case 30:
                return '30';
              case 50:
                return '50';
              case 70:
                return '70';
              case 90:
                return '90';
              case 110:
                return '110';
              case 130:
                return '130';
              case 150:
                return '150';
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
      maxX: 24,
      minY: 0,
      maxY: 150,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(results[0].dateFrom.hour + 0.0, results[0].value),
            FlSpot(results[50].dateFrom.hour + 0.0, results[50].value),
            FlSpot(results[100].dateFrom.hour + 0.0, results[100].value),
            FlSpot(results[150].dateFrom.hour + 0.0, results[150].value),
            FlSpot(results[200].dateFrom.hour + 0.0, results[200].value),
            FlSpot(results[250].dateFrom.hour + 0.0, results[250].value),
            FlSpot(results[300].dateFrom.hour + 0.0, results[300].value),
            FlSpot(results[350].dateFrom.hour + 0.0, results[350].value),
            FlSpot(results[400].dateFrom.hour + 0.0, results[400].value),
            FlSpot(results[450].dateFrom.hour + 0.0, results[450].value),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
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
}

showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      });
  if (results[0].value > 85) {
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("ATENÇÃO"),
      content: Text("BATIMENTOS ALTOS!"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  } else if (results[0].value < 55) {
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("ATENÇÃO"),
      content: Text("BATIMENTOS BAIXOS!"),
      actions: [
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
