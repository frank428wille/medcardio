import 'package:flutter/material.dart';
import 'chart.dart';
import 'getbatimentos.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

@override
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    revokePermissions();
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
              //Text('LOGOTIPO'),
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
                    _navigateToSubPage(context);
                    read();
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

Future _navigateToSubPage(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LineChartSample2()));
}
