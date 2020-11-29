class FutureHours {
  final int idEmployee;
  final String fecha;
  final String nombre;
  final String horaIngreso;
  final String horaSalida;

  FutureHours(
      {this.idEmployee,
      this.fecha,
      this.nombre,
      this.horaIngreso,
      this.horaSalida});

  factory FutureHours.fromJson(Map<String, dynamic> json) {
    return FutureHours(
      idEmployee: json['idEmployees'] as int,
      fecha: json['d'] as String,
      nombre: json['nombreCompleto'] as String,
      horaIngreso: json['horaIngreso'] as String,
      horaSalida: json['horaSalida'] as String,
    );
  }
}
