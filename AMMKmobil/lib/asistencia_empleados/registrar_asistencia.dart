import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/asistencia_empleados/registrar_qr.dart';
import '../design_course_app_theme.dart';
import 'package:http/http.dart' as http;
import '../api/apiResolver.dart';
import './WorkedHours.dart';

var _exitOrUpdate = 0;
bool _stopRegister = false;
var _botonRegistroText = "Registrar";
var _idEmployee = 2;

class WorkedHoursList extends StatelessWidget {
  final List<WorkedHours> workedHours;
  var horaIngreso;
  var horaSalida;

  WorkedHoursList({Key key, this.workedHours}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (workedHours.length > 0) {
      horaIngreso = workedHours[0].horaIngreso;
      if (horaIngreso == null) {
        horaIngreso = "No registrada";
        _botonRegistroText = "Registrar entrada";
      } else {
        _botonRegistroText = "Registrar salida";
        _exitOrUpdate = 1;
      }

      if (workedHours[0].horaSalida != null) {
        horaSalida = workedHours[0].horaSalida;
        _botonRegistroText = "Dia laboral completado";
        _stopRegister = true;
      } else {
        horaSalida = "No registrada";
      }
    } else {
      horaIngreso = "No registrada";
      horaSalida = "No registrada";
    }

    return Container(
        child: Center(
            child: Text(
      "\n\nEntrada: ${horaIngreso}"
      "\n\n"
      "Salida: ${horaSalida}",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    )));
  }
}

class RegisterAsistencia extends StatefulWidget {
  @override
  _RegistrarAsistenciaState createState() => _RegistrarAsistenciaState();
}

// Alert showed when user has register entrance and exit within same day
showAlertDialog(BuildContext context) {
  // set up the button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Día laboral completado"),
    content: Text("Has marcado la entrada y la salida de tu dia laboral."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class _RegistrarAsistenciaState extends State<RegisterAsistencia> {
  final apiEmployees = ApiResolverEmployees();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List months = [
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre'
    ];
    List days = [
      'lunes',
      'martes',
      'miércoles',
      'jueves',
      'viernes',
      'sábado',
      'domingo'
    ];
    DateTime now = DateTime.now();

    String convertedDateTime =
        "Hoy es ${days[now.weekday - 1]} \n${now.day.toString().padLeft(2, '0')}-${months[now.month - 1]}-${now.year.toString()}";
    String hora = "${now.hour.toString()}:${now.minute.toString()}";

    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                    left: 16,
                    right: 16),
                child: Image.asset('assets/images/LOGO_HOGARES_AMMK.jpg'),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  convertedDateTime + "\n Hora local: " + hora,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    color: DesignCourseAppTheme.nearlyBlue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: FutureBuilder<List<WorkedHours>>(
                  future: apiEmployees.getWorkedHoursByEmp(http.Client(),
                      "WorkedHours/idEmployee", _idEmployee.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? WorkedHoursList(workedHours: snapshot.data)
                        : Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Expanded(
                child: Padding(
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
                          textColor: Colors.white,
                          color: _stopRegister == true
                              ? Colors.grey
                              : DesignCourseAppTheme.nearlyBlue,
                          child: Text(
                            _botonRegistroText,
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            _stopRegister == true
                                ? showAlertDialog(context)
                                :
                                // 0 = register entrance
                                // 1 = register exit
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegistrarQR(_exitOrUpdate)));
                          },
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
