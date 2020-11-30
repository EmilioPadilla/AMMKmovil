import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import '../api/apiResolver.dart';
import 'WorkedHours.dart';
import 'FutureHours.dart';

var _idEmployee = 2;
var now = new DateTime.now();
var limitDate = now.add(new Duration(days: 7));
var formatter = new DateFormat('yyyy-MM-dd');
String today = formatter.format(now);
String limitDateStr = formatter.format(limitDate);

class MyWorkedHoursTable extends StatelessWidget {
  final List<WorkedHours> workedHours;

  MyWorkedHoursTable({Key key, this.workedHours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Fecha',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Entrada',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Salida',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Minutos Retraso',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Pago',
                          style: TextStyle(fontWeight: FontWeight.bold)))
                ],
                rows: workedHours
                    .map(
                      (row) => DataRow(cells: [
                        DataCell(Text("${row.fecha}")),
                        DataCell(Text(
                            "${row.horaIngreso != null ? row.horaIngreso.split(" ")[1] : ""}")),
                        DataCell(Text(
                            "${row.horaSalida != null ? row.horaSalida.split(" ")[1] : ""}")),
                        DataCell(Text(
                            "${row.horaIngreso != null ? row.minutosTarde : ""}")),
                        DataCell(Text("${row.pago ?? 0}")),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ));
  }
}

class MyFutureHoursTable extends StatelessWidget {
  final List<FutureHours> futureHours;

  MyFutureHoursTable({Key key, this.futureHours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                      label: Text('Fecha',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Entrada',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Salida',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: futureHours
                    .map(
                      (row) => DataRow(cells: [
                        DataCell(Text("${row.fecha}")),
                        DataCell(Text("${row.horaIngreso}")),
                        DataCell(Text("${row.horaSalida}")),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ));
  }
}

class MiHorario extends StatefulWidget {
  @override
  _MiHorarioState createState() => _MiHorarioState();
}

class _MiHorarioState extends State<MiHorario> {
  final apiEmployees = ApiResolverEmployees();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset('assets/images/logoPaloma.png',
                        width: 150, height: 150),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'MI HORARIO',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      'Turnos Próximos',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    child: FutureBuilder<List<FutureHours>>(
                      future: apiEmployees.getFutureHoursByEmp(http.Client(),
                          today, limitDateStr, _idEmployee.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? MyFutureHoursTable(futureHours: snapshot.data)
                            : Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      'Turnos Previos',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    alignment: Alignment(0.0, 0.0),
                  ),
                  Container(
                    child: FutureBuilder<List<WorkedHours>>(
                      future: apiEmployees.getWorkedHoursByEmp(http.Client(),
                          "WorkedHours/idEmployee", _idEmployee.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? MyWorkedHoursTable(workedHours: snapshot.data)
                            : Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
