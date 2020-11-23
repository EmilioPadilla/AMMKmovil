import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../design_course_app_theme.dart';
import 'dart:async';
import '../api/apiResolver.dart';

class RegistrarQR extends StatefulWidget {
  final int exitOrUpdate;
  const RegistrarQR(this.exitOrUpdate);
  @override
  _RegistrarQRState createState() => _RegistrarQRState();
}



class _RegistrarQRState extends State<RegistrarQR> {
  String qrCodeResult;
  bool backCamera = true;
  DateTime now = DateTime.now();
  ApiResolver api = new ApiResolver();
  @override
  Widget build(BuildContext context) {
    print(now.toString());
    if (widget.exitOrUpdate == 0) {
      api.registerEntrance(1, now.toString());
    } else {
      api.registerExit('2', now.toString());
    }

    print(widget.exitOrUpdate);


    return Scaffold(
        appBar: AppBar(
          title: Text("Escanear con: " + (backCamera ? "Frontal" : "Trasera")),
          backgroundColor: DesignCourseAppTheme.nearlyBlue,
          actions: <Widget>[
            IconButton(
              icon: backCamera
                  ? Icon(Ionicons.ios_reverse_camera)
                  : Icon(Icons.camera),
              onPressed: () {
                setState(() {
                  backCamera = !backCamera;
                  camera = backCamera ? 1 : -1;
                });
              },
            ),
            IconButton(
              icon: Icon(MaterialCommunityIcons.qrcode_scan),
              onPressed: () {
                _scan();
              },
            )
          ],
        ),

        body: Column(
          children: <Widget>[
            Container (
              child: Text(
                (qrCodeResult == null) || (qrCodeResult == "")
                    ? "Escanee el código dado por el administrador"
                    : "Resultado:" + qrCodeResult,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
    );
  }
  Future<void> _scan() async {
    ScanResult codeSanner = await BarcodeScanner.scan(
      options: ScanOptions(
        useCamera: camera,
      ),
    );
    setState(() {
      qrCodeResult = codeSanner.rawContent;
      print(qrCodeResult);
    });
  }
}
int camera = 1;
