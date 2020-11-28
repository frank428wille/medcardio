import 'package:fit_kit/fit_kit.dart';
import 'package:fl_chart/fl_chart.dart';

double teste2, horaExata;
var results, items;
int teste;
String condi = '';

void read() async {
  try {
    results = await FitKit.read(
      DataType.HEART_RATE,
      dateFrom: DateTime.now().subtract(Duration(hours: 24)),
      dateTo: DateTime.now(),
    );

    if (results[teste].value <= 55) {
      condi = 'Excelente';
    } else if (results[teste].value >= 62 && results[teste].value <= 69) {
      condi = 'Boa';
    } else if (results[teste].value >= 70 && results[teste].value <= 78) {
      condi = 'Normal';
    } else if (results[teste].value >= 79 && results[teste].value <= 84) {
      condi = 'Razoável';
    } else if (results[teste].value >= 85) {
      condi = 'Ruim';
    }
  } on UnsupportedException catch (e) {
    // thrown in case e.dataType is unsupported
  }
}

Future<void> revokePermissions() async {
  String result = '';
  results.clear();
  bool permissions;

  try {
    await FitKit.revokePermissions();
    permissions = await FitKit.hasPermissions(DataType.values);
    result = 'revokePermissions: success';
  } catch (e) {
    result = 'revokePermissions: $e';
  }
}
