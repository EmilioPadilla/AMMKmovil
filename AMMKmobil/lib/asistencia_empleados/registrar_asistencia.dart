import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/asistencia_empleados/registrar_qr.dart';
import '../design_course_app_theme.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List months = ['Enero', 'Febrero','Marzo', 'Abril',  'Mayo','Junio','Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'];
    List days = ['lunes','martes', 'miércoles', 'jueves', 'viernes', 'sábado','domingo'];
    DateTime now = DateTime.now();

    String convertedDateTime =
        "Hoy es ${days[now.weekday-1]} \n${now.day.toString().padLeft(2, '0')}-${months[now.month-1]}-${now.year.toString()}";
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
                child: const Text(
                  '\n\n\nEntrada: No registrada',
                  // textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: const Text(
                  'Salida: No registrada',
                  // textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
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
                          textColor:  Colors.white,
                          color: DesignCourseAppTheme.nearlyBlue,
                          child: Text('Registrar entrada', textAlign: TextAlign.center,),
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> RegistrarQR()));
                          },
                        )
                    ),
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
