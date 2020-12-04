import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'getbatimentos.dart';
import 'main.dart';

// ignore: must_be_immutable
class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

//CLASSE PARA CRIAR TELA PRINCIPAL
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
                          '${results[teste].value}',
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
                            '${condicao()}',
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
                read();
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
                  setState(() {});
                }),
          ),
        ],
      ),
    );
  }

//FUNÇÃO PARA RETORNAR A TELA DE LOGIN
  Future _navigateToSubPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

//FUNÇÃO DE CRIAÇÃO DO GRAFICO
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

      /* Especifica os valores do eixa das abscissas indicando os valores em 
      horas do dia. */
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
        /* Cria os valores do eixo das ordenadas indicando os valres em 
        batimentos por minuto. */
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
      /* Especifica os valores e efeitos do grafico. */
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 24,
      minY: 0,
      maxY: 150,
      lineBarsData: [
        LineChartBarData(
          spots: montaGrafico(),
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

//FUNÇÃO DE CRIAÇÃO DE ALERTAS DE BATIMENTOS.
showAlertDialog1(BuildContext context) {
  // configura o button
  Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      });
  if (results[teste].value > 85) {
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
  } else if (results[teste].value < 55) {
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

//FUNÇÃO QUE FORNECE DADOS PARA CONSTRUÇÃO DO GRAFICO.
List<FlSpot> montaGrafico() {
  List<FlSpot> dadoGrafico = new List<FlSpot>();
  FlSpot dados;
  /* Transforma o resultado da leitura do google fit em uma lista gerando 
  uma quantidade fixa de dados lidos fornecendo um paramentro para ler os 
  valores para que seja distribuidos graficamente. */
  items = results.toList();
  final List fixedList = Iterable<int>.generate(items.length).toList();
  teste = fixedList.last;
  /* Faz a varredura de forma procedural de todos os dados coletados trazendo
  a hora e o valor daquela hora. */
  for (int i = 0; i <= teste; i++) {
    dados = FlSpot(results[i].dateFrom.hour + 0.0, results[i].value);
    dadoGrafico.add(dados);
  }

  return dadoGrafico;
}
