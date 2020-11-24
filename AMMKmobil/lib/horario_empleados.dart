import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorarioEmpleados extends StatefulWidget {
  @override
  _HorarioEmpleadosState createState() => _HorarioEmpleadosState();
}

class _HorarioEmpleadosState extends State<HorarioEmpleados> {
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
                      'HORARIO EMPLEADOS',
                      style: TextStyle(
                        fontSize: 30,
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
                                label: Text('Empleado',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold))),
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
                          ], rows: [
                            DataRow(selected: true, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                            DataRow(selected: false, cells: [
                              DataCell(Text('John Doe')),
                              DataCell(Text('12/09/2020')),
                              DataCell(Text('7:00 AM')),
                              DataCell(Text('1:00 PM')),
                              DataCell(Text('A tiempo')),
                            ]),
                          ]),
                        ),
                      ),
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
