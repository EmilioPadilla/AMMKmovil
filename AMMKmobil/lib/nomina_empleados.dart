import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class NominaEmpleados extends StatefulWidget {
  @override
  _NominaEmpleadosState createState() => _NominaEmpleadosState();
}

class _NominaEmpleadosState extends State<NominaEmpleados> {
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
                    child: Image.asset('assets/images/logoPaloma.png',width: 150,height: 150),
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
                    padding: const EdgeInsets.only(top: 16),
                    child: const Text(
                      'Periodo: 01/09/20 - 15/09/20',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(

                        child:
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child:

                          DataTable(
                              columns: [

                                DataColumn(label: Text('Empleado',style: TextStyle(fontWeight: FontWeight.bold)),),
                                DataColumn(label: Text('# dias',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Percepciones',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Deducciones',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Total',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Faltas',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Retardos',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Tipo de Pago',style: TextStyle(fontWeight: FontWeight.bold))),



                              ],
                              rows: [
                                DataRow(
                                    selected: true,
                                    cells: [
                                      DataCell(Text ('Maria Sandoval')),
                                      DataCell(Text ('10')),
                                      DataCell(Text ('3000')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4000')),
                                      DataCell(Text ('2')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Deposito de Cuenta')),




                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('Eduardo Salazar')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Efectivo')),



                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('Cristina Casas')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Cheque')),



                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('Victor Gomez')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Efectivo')),


                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('Catalina Mendoza')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Cheque')),




                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('Alejandro Gonzalez')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),
                                      DataCell(Text ('Cheque')),



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
    );
  }


}
