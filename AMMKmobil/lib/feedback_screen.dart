import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'package:best_flutter_ui_templates/percepciones.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'deducciones.dart';


class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
                    child: Image.asset('assets/images/logoPaloma.png',width: 150,height: 150),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'MI NÓMINA',
                      style: TextStyle(
                        fontSize: 40,
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
                  Container(
                      height:50,
                      padding: EdgeInsets.fromLTRB(100,0,100,10),
                      child: RaisedButton(
                        textColor:  Colors.white,
                        color:Colors.blueAccent,
                        child: Text('Percepciones'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Percepciones())
                          );
                        },
                      )

                  ),
                  Container(
                      height:50,
                      padding: EdgeInsets.fromLTRB(100,0,100,10),
                      child: RaisedButton(
                        textColor:  Colors.white,
                        color:Colors.blueAccent,
                        child: Text('Deducciones'),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Deducciones())
                          );
                        },
                      )

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

                                DataColumn(label: Text('Periodo',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('# dias',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Percepciones',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Deducciones',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Total',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Faltas',style: TextStyle(fontWeight: FontWeight.bold))),
                                DataColumn(label: Text('Retardos',style: TextStyle(fontWeight: FontWeight.bold))),

                              ],
                              rows: [
                                DataRow(
                                    selected: true,
                                    cells: [
                                      DataCell(Text ('01/09/20 - 15/09/20')),
                                      DataCell(Text ('10')),
                                      DataCell(Text ('3000')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4000')),
                                      DataCell(Text ('2')),
                                      DataCell(Text ('1')),


                                    ]),
                                DataRow(
                                    selected: false,
                                    cells: [
                                      DataCell(Text ('15/08/20 - 31/08/20')),
                                      DataCell(Text ('15')),
                                      DataCell(Text ('3500')),
                                      DataCell(Text ('1000')),
                                      DataCell(Text ('4500')),
                                      DataCell(Text ('0')),
                                      DataCell(Text ('1')),


                                    ]),

                            DataRow(
                                selected: false,
                                cells: [
                                  DataCell(Text ('15/08/20 - 31/08/20')),
                                  DataCell(Text ('15')),
                                  DataCell(Text ('3500')),
                                  DataCell(Text ('1000')),
                                  DataCell(Text ('4500')),
                                  DataCell(Text ('0')),
                                  DataCell(Text ('1')),



                                ]),
                            DataRow(
                                selected: false,
                                cells: [
                                  DataCell(Text ('15/08/20 - 31/08/20')),
                                  DataCell(Text ('15')),
                                  DataCell(Text ('3500')),
                                  DataCell(Text ('1000')),
                                  DataCell(Text ('4500')),
                                  DataCell(Text ('0')),
                                  DataCell(Text ('1')),



                                ]),
                            DataRow(
                                selected: false,
                                cells: [
                                  DataCell(Text ('15/08/20 - 31/08/20')),
                                  DataCell(Text ('15')),
                                  DataCell(Text ('3500')),
                                  DataCell(Text ('1000')),
                                  DataCell(Text ('4500')),
                                  DataCell(Text ('0')),
                                  DataCell(Text ('1')),



                                ]),
                            DataRow(
                                selected: false,
                                cells: [
                                  DataCell(Text ('15/08/20 - 31/08/20')),
                                  DataCell(Text ('15')),
                                  DataCell(Text ('3500')),
                                  DataCell(Text ('1000')),
                                  DataCell(Text ('4500')),
                                  DataCell(Text ('0')),
                                  DataCell(Text ('1')),



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
