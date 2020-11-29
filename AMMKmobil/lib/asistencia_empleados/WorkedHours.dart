class WorkedHours {
  final int id;
  final int idEmployee;
  final String nombre;
  final String horaIngreso;
  final String horaSalida;
  final int minutosTarde;
  final int pago;

  WorkedHours(
      {this.id,
      this.idEmployee,
      this.nombre,
      this.horaIngreso,
      this.horaSalida,
      this.minutosTarde,
      this.pago});

  factory WorkedHours.fromJson(Map<String, dynamic> json) {
    return WorkedHours(
        id: json['id'] as int,
        idEmployee: json['employees_id'] as int,
        nombre: json['nombreCompleto'] as String,
        horaIngreso: json['horaIngreso'] as String,
        horaSalida: json['horaSalida'] as String,
        minutosTarde: json['minutosTarde'] as int,
        pago: json['pago'] as int);
  }
}
