import '../api/apiResolver.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:sweetalert/sweetalert.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'view_absences.dart';

final _idEmployee = 1;

class NotifyAbsence extends StatefulWidget {
  @override
  _NotifyAbsence createState() => _NotifyAbsence();
}

class _NotifyAbsence extends State<NotifyAbsence> {
  @override
  void initState() {
    super.initState();
  }

  ApiResolverAbsences apiAbsences = new ApiResolverAbsences();

  final _formKey = GlobalKey<FormState>();
  final format = DateFormat("yyyy-MM-dd");
  final motivoController = new TextEditingController();
  dynamic fechaController;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    motivoController.dispose();
    super.dispose();
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
              child: Center(
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
                    'Notificar ausencia',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Form(
                    key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: motivoController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.text_fields),
                            labelText: 'Explicacion de la ausencia'
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Cuéntanos el motivo de la ausencia.';
                          }
                          return null;
                        },
                        onSaved: (String value) {
                          print('Value for field saved as "$value"');
                        },
                      ),
                      DateTimeField(
                        format: format,
                        // controller: fechaController,
                        decoration: InputDecoration(
                            icon: Icon(Icons.date_range),
                            labelText: 'Fecha de la ausencia'
                        ),
                        validator: (object) {
                          if (object == null) {
                            return 'Elige una fecha.';
                          }
                          return null;
                        },
                        onShowPicker: (context, currentValue) async {
                          final time = await showDatePicker (
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: currentValue ?? DateTime.now(),
                              lastDate: DateTime(2100));
                          fechaController = await time;
                          return time;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Align (
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(

                            onPressed: () {
                              // Validate returns true if the form is valid, or false
                              // otherwise.

                              if (_formKey.currentState.validate()) {
                                  apiAbsences.registerAbsence(
                                    _idEmployee, motivoController.text,
                                    fechaController.toString());

                                  SweetAlert.show(context,
                                      title: "Ausencia registrada",
                                      style: SweetAlertStyle.success);


                                  new Future.delayed(new Duration(seconds: 2),(){
                                    Navigator.of(context).pop();
                                  });
                                }
                              },
                            child: Text('Registrar'),
                          ),

                          ),
                      ),
                    ],
                  ),
                ),
              ]
              ),
              ),
          ),
        ),
    ),
    );
  }
}

