import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import '../design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/api/apiResolver.dart';
import 'package:best_flutter_ui_templates/absences/absences.dart';
import 'package:http/http.dart' as http;

final _idEmployee = 1;

class AbsencesTable extends StatelessWidget {
  final List<Absences> absencesList;

  AbsencesTable({Key key, this.absencesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding (
        padding: const EdgeInsets.only(top: 16),
        child: Center(
          child: Container(

            child:
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(
                    label: Text('Empleado',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Fecha',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  DataColumn(
                    label: Text('Motivo',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
                rows: absencesList
                    .map(
                      (absence) => DataRow(
                      cells: [
                        DataCell(Container(
                            width: 70, //SET width
                            child: Text("${absence.nombreCompleto ?? "No registrado"}"))),

                        DataCell(
                          Text("${absence.fecha ?? "No registrado"}"),
                        ),
                        DataCell(Container(
                            width: 200, //SET width
                            child: Text("${absence.motivoAusencia ?? "No registrado"}"))),
                      ]),
                )
                    .toList(),
              ),
            ),
          ),
        )
    );
  }


}


class AbsencesActivityAdmin extends StatefulWidget {
  @override
  _AbsencesAdminWidgetState createState() => _AbsencesAdminWidgetState();
}

class _AbsencesAdminWidgetState extends State<AbsencesActivityAdmin> {
  @override
  void initState() {
    super.initState();
  }

  ApiResolverAbsences apiAbsences = new ApiResolverAbsences();

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
                  child: Image.asset('assets/images/logoPaloma.png',width: 150,height: 150),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Ausencias de empleados',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: FutureBuilder<List<Absences>>(
                    future: apiAbsences.getAdminAbsences(http.Client(), "Absences"),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) print(snapshot.error);
                      return snapshot.hasData
                          ? AbsencesTable(absencesList: snapshot.data)
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



