import '../asistencia_empleados/WorkedHours.dart';
import '../asistencia_empleados/FutureHours.dart';
import '../nomina_empleados/Payrolls.dart';
import '../absences/absences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

String apiUrl = 'http://api.gestionammk.com/api';

class ApiResolverEmployees {
  ApiResolverEmployees();

  //Function to register entrance from employee
  Future<http.Response> registerEntrance(
      int idEmpl, String fecha, String horaEntrada) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map jsonBody = {
      'employees_id': idEmpl,
      'fecha': fecha,
      'horaIngreso': horaEntrada
    };

    var body = json.encode(jsonBody);
    final response = await http.post(apiUrl + "/attendanceArrival",
        headers: headers, body: body);
    // print("respuesta ${response.statusCode}");
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
      print(response.body);
      //return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response.body);
    }
  }

  //Function to register exit from employee
  Future<http.Response> registerExit(
      int idEmpl, String fecha, String horaSalida) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map jsonBody = {
      'idEmployees': idEmpl,
      'fecha': fecha,
      'horaSalida': horaSalida
    };
    var body = json.encode(jsonBody);
    final response = await http.post(apiUrl + "/attendanceExit",
        headers: headers, body: body);
    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      // return Post.fromJson(json.decode(response.body));
      // return json.decode(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception(response.body);
    }
  }

  List<WorkedHours> parseGetWorkedHours(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<WorkedHours>((json) => WorkedHours.fromJson(json))
        .toList();
  }

  List<FutureHours> parseGetFutureHours(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<FutureHours>((json) => FutureHours.fromJson(json))
        .toList();
  }

  Future<List<WorkedHours>> getClosestShiftByEmp(
      http.Client client, String api, String idEmployee) async {
    final response = await client.get(apiUrl + "/" + api + "/" + idEmployee);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetWorkedHours(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }

  Future<List<WorkedHours>> getWorkedHoursByEmp(
      http.Client client, String api, String idEmployee) async {
    final response = await client.get(apiUrl + "/" + api + "/" + idEmployee);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetWorkedHours(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }

  Future<List<FutureHours>> getFutureHoursByEmp(http.Client client,
      String startDate, String endDate, String idEmployee) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map jsonBody = {
      'idEmployees': idEmployee,
      'startDate': startDate,
      'endDate': endDate
    };
    var body = json.encode(jsonBody);

    final response = await client.post(apiUrl + "/employeesShifts/future",
        headers: headers, body: body);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetFutureHours(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }
}

class ApiResolverAbsences {
  ApiResolverAbsences();

  List<Absences> parseGetAbsences(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Absences>((json) => Absences.fromJson(json)).toList();
  }

  Future<List<Absences>> getAbsences(
      http.Client client, String api, String idEmployee) async {
    final response = await client.get(apiUrl + "/" + api + "/" + idEmployee);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetAbsences(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }

  Future<List<Absences>> getAdminAbsences(
      http.Client client, String api) async {
    final response = await client.get(apiUrl + "/" + api);
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetAbsences(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }

  Future<http.Response> registerAbsence(
      int idEmpl, String motivoAusencia, String fecha) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map jsonBody = {
      'employees_id': idEmpl,
      'motivoAusencia': motivoAusencia,
      'fecha': fecha
    };

    var body = json.encode(jsonBody);
    final response =
        await http.post(apiUrl + "/Absences", headers: headers, body: body);
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
}

class ApiResolverPayrolls {
  ApiResolverPayrolls();

  List<Payrolls> parseGetPayrolls(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Payrolls>((json) => Payrolls.fromJson(json)).toList();
  }

  Future<List<Payrolls>> getPayrolls(
      http.Client client, String idEmployees) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map jsonBody = {'idEmployees': idEmployees};
    var body = json.encode(jsonBody);

    final response =
        await client.post(apiUrl + "/payrolls", headers: headers, body: body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return parseGetPayrolls(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load response');
    }
  }
}
