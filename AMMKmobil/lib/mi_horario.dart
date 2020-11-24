import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class RowHorario {
  final int id;
  final String horaIngreso;
  final String horaSalida;

  RowHorario({this.id, this.horaIngreso, this.horaSalida});

  factory RowHorario.fromJson(Map<String, dynamic> json) {
    return RowHorario(
      id: json['id'] as int,
      horaIngreso: json['horaIngreso'] as String,
      horaSalida: json['horaSalida'] as String,
    );
  }
}

class ApiResolver {
  String _baseUrl = 'http://10.0.2.2:8000/api';

  ApiResolver();

  List<RowHorario> parseRows(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<RowHorario>((json) => RowHorario.fromJson(json)).toList();
  }

  Future<List<RowHorario>> httpGet(http.Client client, String api) async {
    final response = await client.get(_baseUrl + "/" + api);
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseRows(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }
}

class RowHorarioList extends StatelessWidget {
  final List<RowHorario> rows;

  RowHorarioList({Key key, this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: [
        DataColumn(
            label:
                Text('Entrada', style: TextStyle(fontWeight: FontWeight.bold))),
        DataColumn(
            label:
                Text('Salida', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: rows
          .map(
            (row) => DataRow(selected: false, cells: [
              DataCell(Text(row.horaIngreso)),
              DataCell(
                Text(row.horaSalida),
              ),
            ]),
          )
          .toList(),
    );
  }
}

class MiHorario extends StatefulWidget {
  @override
  _MiHorarioState createState() => _MiHorarioState();
}

class _MiHorarioState extends State<MiHorario> {
  final api = ApiResolver();

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
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(columns: [
                            DataColumn(
                                label: Text('Fecha',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Entrada',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Salida',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Asistencia',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('Pago',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)))
                          ], rows: [
                            DataRow(selected: true, cells: [
                              DataCell(Text('01/09/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4000')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('15/08/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4500')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('15/08/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4500')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('15/08/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4500')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('15/08/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4500')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('15/08/20')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                              DataCell(Text('4500')),
                            ]),
                          ]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                        child: Container(
                            child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: FutureBuilder<List<RowHorario>>(
                        future:
                            api.httpGet(http.Client(), "/workedHours/search"),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? RowHorarioList(rows: snapshot.data)
                              : Center(child: CircularProgressIndicator());
                        },
                      ),
                    ))),
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
