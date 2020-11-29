import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Deducciones extends StatefulWidget {
  @override
  _DeduccionesState createState() => _DeduccionesState();
}

class _DeduccionesState extends State<Deducciones> {
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
                    'MI NÓMINA',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 16),
                  child: const Text(
                    'JHON DOE    27     CHOFER',
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

                              DataColumn(label: Text('Concepto',style: TextStyle(fontWeight: FontWeight.bold)),),
                              DataColumn(label: Text('Monto',style: TextStyle(fontWeight: FontWeight.bold))),




                            ],
                            rows: [
                              DataRow(
                                  selected: true,
                                  cells: [
                                    DataCell(Text ('ISPT')),
                                    DataCell(Text ('500.00')),




                                  ]),
                              DataRow(
                                  selected: false,
                                  cells: [
                                    DataCell(Text ('Seguro Social')),
                                    DataCell(Text ('500.00')),



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
