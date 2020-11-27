class Payrolls {
  final int idEmployee;
  final String nombre;
  final int asistencias;
  final String inicio;
  final String fin;
  final int faltas;
  final int retardos;
  final String pago;

  Payrolls(
      {this.idEmployee,
      this.nombre,
      this.asistencias,
      this.inicio,
      this.fin,
      this.faltas,
      this.retardos,
      this.pago});

  factory Payrolls.fromJson(Map<String, dynamic> json) {
    return Payrolls(
      idEmployee: json['idEmployees'] as int,
      nombre: json['nombre'] as String,
      asistencias: json['asistencias'] as int,
      inicio: json['inicio'] as String,
      fin: json['fin'] as String,
      faltas: json['faltas'] as int,
      retardos: json['retardos'] as int,
      pago: json['pago'] as String,
    );
  }
}
