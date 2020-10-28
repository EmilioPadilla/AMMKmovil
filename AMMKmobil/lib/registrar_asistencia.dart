import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';

import 'design_course_app_theme.dart';

class HelpScreen extends StatefulWidget {
  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  String convertirDia(int dia) {
    switch (dia) {
      case 1:
        return "lunes";
        break;
      case 2:
        return "martes";
        break;
      case 3:
        return "miércoles";
        break;
      case 4:
        return "jueves";
        break;
      case 5:
        return "viernes";
        break;
      case 6:
        return "sábado";
        break;
      case 7:
        return "domingo";
        break;
    }
  }

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
    String nombreDia = convertirDia(now.weekday);

    String convertedDateTime =
        "Hoy es ${days[now.weekday-1]} \n${now.day.toString().padLeft(2, '0')}-${months[now.month-1]}-${now.year.toString()}";
    String hora = "${now.hour.toString()}:${now.minute.toString()}";
    // String now = dateFormat.format(DateTime.now());
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
                  padding: const EdgeInsets.all(8.0),
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
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                'Registrar entrada',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
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
