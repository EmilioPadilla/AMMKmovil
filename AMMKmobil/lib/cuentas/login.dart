import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  var arr = ["admin","password"];
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
            child: Form(          // <= NEW
              key: _formKey,
                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Image.asset('assets/images/LogoAmmk.jpg',
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
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Iniciar Sesión'),
                      onPressed: () {
                        final form = _formKey.currentState;
                        form.save();

                        // Validate will return true if is valid, or false if invalid.
                        if (form.validate()) {
                          print("$_username $_password");
                          if(_username == arr[0] && _password == arr[1]) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NavigationHomeScreen(user: _username,))
                            );
                          }
                        }
                      },
                    )),
              ],
        ))));
  }
}