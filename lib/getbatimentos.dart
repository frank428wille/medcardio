import 'package:fit_kit/fit_kit.dart';
import 'package:fl_chart/fl_chart.dart';

double teste2, horaExata;
var results;
List lista;
var b, data1, data2;
List<FlSpot> grafico;
void read() async {
  try {
    results = await FitKit.read(
      DataType.HEART_RATE,
      dateFrom: DateTime.now().subtract(Duration(days: 5)),
      dateTo: DateTime.now(),
    );
    b = results.length;
    print('$b');
    teste2 = results[0].value;
    horaExata = results[0].dateFrom.hour + 0.0;
    montaGrafico();
  } on UnsupportedException catch (e) {
    // thrown in case e.dataType is unsupported
  }
}

montaGrafico() {
  for (int i = 0; i <= b; i++) {
    data1 = results[i].dateFrom.hour + 0.0;
    data2 = results[i].value;
    i = i += i;
  }
}
