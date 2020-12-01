import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var IdC;
var IdR;
var IdE;
var userError;
var passError;

Future<Cuenta> createAlbum(String username, String password) async {
  final http.Response response = await http.post(
    'http://api.gestionammk.com/api/account/login/confirmation',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{'username': username, 'password': password}),
  );

  if (response.statusCode == 200) {
    IdC = 0;
    IdR = 0;
    if (response.body == "0") {
      final jsonresponse = json.decode(response.body);
      print("Error 0");
      userError = 1;
      return Cuenta.fromJson(jsonresponse);
    } else if (response.body == "-1") {
      final jsonresponse = json.decode(response.body);
      print("Error -1");
      passError = 1;
      return Cuenta.fromJson(jsonresponse);
    } else {
      final jsonresponse = json.decode(response.body);
      print(jsonresponse[0]);
      return Cuenta.fromJson(jsonresponse[0]);
    }
  } else {
    print(response.statusCode);
    print(response.body);
    // throw Exception('Failed to login.');
  }
}

class Cuenta {
  final String idCuenta;
  final String idRol;
  final String idEmployee;

  Cuenta({this.idCuenta, this.idRol, this.idEmployee});

  factory Cuenta.fromJson(Map<String, dynamic> json) {
    IdC = json['id'].toString();
    IdR = json['idRol'].toString();
    IdE = json['idEmployee'].toString();
    return Cuenta(
      idCuenta: json['id'].toString(),
      idRol: json['idRol'].toString(),
      idEmployee: json['idEmployee'].toString(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Future<Cuenta> _futureAlbum;
  String idRol;
  int confError;
  String idCuenta;
  String _password;
  String _username;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maximiliano María Kolbe'),
          automaticallyImplyLeading: false,
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Form(
                // <= NEW

                key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Image.asset(
                        'assets/images/LogoAmmk.jpg',
                        width: 400,
                        height: 250,
                      ),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Inicio de Sesión',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        onSaved: (value) => _username = value,
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: TextFormField(
                        onSaved: (value) => _password = value,
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Contraseña',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(100, 0, 100, 10),
                        child: ((userError == null && passError == null) ||
                                confError == null)
                            ? Text("")
                            : Text("Información incorrecta")),
                    Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(100, 0, 100, 10),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Iniciar Sesión'),
                          onPressed: () {
                            final form = _formKey.currentState;
                            form.save();
                            if (form.validate()) {
                              setState(() {
                                _futureAlbum =
                                    createAlbum(_username, _password);
                              });
                            }
                            Future.delayed(const Duration(milliseconds: 4000),
                                () {
                              if (IdC != 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NavigationHomeScreen(
                                              user: [IdC, IdR, IdE],
                                            )));
                              } else {
                                setState(() {
                                  confError = 1;
                                  _showAlertDialog();
                                });
                              }
                            });
                            // Validate will return true if is valid, or false if invalid.
                          },
                        )),
                  ],
                ))));
  }

  void _showAlertDialog() {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Información de Sesión Incorrecta"),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  "CERRAR",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
