import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import '../design_course_app_theme.dart';
import 'package:best_flutter_ui_templates/api/apiResolver.dart';
import 'package:best_flutter_ui_templates/absences/absences.dart';
import 'package:http/http.dart' as http;
import 'notify_absence.dart';

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
            label: Text('Fecha',style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        DataColumn(label: Text('Motivo',style: TextStyle(fontWeight: FontWeight.bold))),
      ],
      rows: absencesList
          .map(
            (absence) => DataRow(
            cells: [
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


class AbsencesActivity extends StatefulWidget {
  @override
  _AbsencesWidgetState createState() => _AbsencesWidgetState();
}

class _AbsencesWidgetState extends State<AbsencesActivity> {
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
                    'Mis ausencias',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Container(
                        width: 140,
                        height: 40,
                        decoration: BoxDecoration(
                          color: DesignCourseAppTheme.nearlyBlue,
                          borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: RaisedButton(
                          textColor:  Colors.white,
                          color: DesignCourseAppTheme.nearlyBlue,
                          child: Text('Registrar ausencia', textAlign: TextAlign.center,),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => NotifyAbsence()));
                          },
                        )
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: FutureBuilder<List<Absences>>(
                    future: apiAbsences.getAbsences(http.Client(), "Absences", _idEmployee.toString()),
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



