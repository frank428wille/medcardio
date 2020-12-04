import 'package:flutter/material.dart';
import 'chart.dart';
import 'getbatimentos.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

//CLASSE PARA CRIAR TELA DE LOGIN
@override
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    read();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff37434d),
          title: Text('Medição Cardio', textAlign: TextAlign.center),
        ),
        body: Container(
          decoration: const BoxDecoration(color: Color(0xff232d37)),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 200.0,
                child: new PageView(
                  children: <Widget>[
                    Image.asset('assets/logo.png'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('ENTRAR'),
                  onPressed: () {
                    read();
                    _navigateToSubPage(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//FUNÇÃO PARA CHAMAR PAGINA PRINCIPAL
Future _navigateToSubPage(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LineChartSample2()));
}
