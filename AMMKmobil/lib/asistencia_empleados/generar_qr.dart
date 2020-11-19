import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import '../design_course_app_theme.dart';
import 'dart:async';

class GenerarQr extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GenerarQRState();
}
class GenerarQRState extends State<GenerarQr> {
  static DateTime ahora = DateTime.now();


  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 30), (timer) {
      setState(() {
        ahora = new DateTime.now();
        dummyData = ahora.toString();
      });
    });

    return  Container(
        color: AppTheme.nearlyWhite,
        child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
      // appBar: AppBar(
      //   title: Text('Generar código QR'),
      //   backgroundColor: DesignCourseAppTheme.nearlyBlue,
      // ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 16,
                right: 16),
            child: Image.asset('assets/images/LOGO_HOGARES_AMMK.jpg'),
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
                      child: Text('Generar Código', textAlign: TextAlign.center,),
                      onPressed: () {
                        setState(() {
                          ahora = new DateTime.now();
                          dummyData = ahora.toString();
                        });
                      },
                    )
                ),
              ),
            ),
          ),
          (dummyData == null)
              ? Center(child: Text("Dar click en botón"))
              : QrImage(
                embeddedImage:  AssetImage('assets/images/logoPaloma.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(200, 160),
                ),
                data: dummyData,
                gapless: true,
              ),
        ],
      ),
    ),
        ),
    );
  }
}
String dummyData;
TextEditingController qrTextController = TextEditingController();

