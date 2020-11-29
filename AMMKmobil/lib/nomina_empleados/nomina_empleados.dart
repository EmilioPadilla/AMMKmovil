import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../api/apiResolver.dart';
import 'Payrolls.dart';

class EmployeePayrollsTable extends StatelessWidget {
  final List<Payrolls> payrolls;

  EmployeePayrollsTable({Key key, this.payrolls}) : super(key: key);

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
                      label: Text('Empleado',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Periodo',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Turnos',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Faltas',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  DataColumn(
                      label: Text('Retardos',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                ],
                rows: payrolls
                    .map(
                      (row) => DataRow(cells: [
                        DataCell(Text("${row.nombre}")),
                        DataCell(Text("${row.inicio + ' - ' + row.fin}")),
                        DataCell(Text("${row.asistencias}")),
                        DataCell(Text("${row.pago ?? 0}")),
                        DataCell(Text("${row.faltas}")),
                        DataCell(Text("${row.retardos}")),
                      ]),
                    )
                    .toList(),
              ),
            ),
          ),
        ));
  }
}

class NominaEmpleados extends StatefulWidget {
  @override
  _NominaEmpleadosState createState() => _NominaEmpleadosState();
}

class _NominaEmpleadosState extends State<NominaEmpleados> {
  final apiPayrolls = ApiResolverPayrolls();

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
                    'NÓMINA EMPLEADOS',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: FutureBuilder<List<Payrolls>>(
                    future: apiPayrolls.getPayrolls(http.Client(), "0"),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? EmployeePayrollsTable(payrolls: snapshot.data)
                          : Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
