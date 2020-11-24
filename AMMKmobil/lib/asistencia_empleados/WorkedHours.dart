

class WorkedHours {
  final int id;
  final int idEmployee;
  final String horaIngreso;
  final String horaSalida;

  WorkedHours({this.id, this.idEmployee, this.horaIngreso, this.horaSalida});

  factory WorkedHours.fromJson(Map<String, dynamic> json) {
    return WorkedHours(
      id: json['id'] as int,
      idEmployee: json['idEmployee'] as int,
      horaIngreso: json['horaIngreso'] as String,
      horaSalida: json['horaSalida'] as String,
    );
  }
}
