import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String apiUrl = 'http://10.0.2.2:8000/api';
var _idEmployee = 1;

class ApiResolver {
  ApiResolver();

  //Function to register entrance from employee
  Future<http.Response> registerEntrance(int idEmpl, String horaEntrada) async {
    Map<String, String> headers = {'Content-Type' : 'application/json'};
    Map json_body = {
      'employees_id' : idEmpl ,
      'horaIngreso': horaEntrada
    };

    var body = json.encode(json_body);
    final response = await http.post(apiUrl+ "/WorkedHours", headers: headers, body: body);
    print("respuesta ${response.statusCode}");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
      // print(response.body);
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response.body);
    }
  }

  //Function to register exit from employee
  Future<http.Response> registerExit(String idEntrance, String horaSalida) async {
    Map<String, String> headers = {'Content-Type' : 'application/json'};
    Map json_body = {
      'horaSalida': horaSalida
    };
    print("Api $horaSalida");

    var body = json.encode(json_body);
    final response = await http.put(apiUrl+ "/WorkedHours/"+idEntrance, headers: headers, body: body);
    print("respuesta ${response.statusCode}");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
      print("Cuerpo ${response.request}");
      return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response.body);
    }
  }

}
