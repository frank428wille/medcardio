import 'package:fit_kit/fit_kit.dart';
import 'package:fl_chart/fl_chart.dart';

double teste2, horaExata;
var results, items;
int teste;

//FUNÇÃO QUE REALIZA LOGIN VIA GOOGLE, E LEITURA DE DADOS DO GOOGLE FIT
void read() async {
  try {
    /*Realiza leitura através da biblioteca fitkit, podendo ser um dado 
    especifico ou mais de um. */
    results = await FitKit.read(
      DataType.HEART_RATE,
      dateFrom: DateTime.now().subtract(Duration(hours: 12)),
      dateTo: DateTime.now(),
    );
  } on UnsupportedException catch (e) {
    // thrown in case e.dataType is unsupported
  }
}

//FUNÇÃO PARA SAIR DA CONTA GOOGLE.
Future<void> revokePermissions() async {
  String result = '';
  bool permissions;
/* Revoga as permissões do Google Account. */
  try {
    await FitKit.revokePermissions();
    permissions = await FitKit.hasPermissions(DataType.values);
    result = 'revokePermissions: success';
  } catch (e) {
    result = 'revokePermissions: $e';
  }
}

String condicao() {
  String condi = '';
  /* Indica a condição dos batimentos no momento. */
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

  return condi;
}
