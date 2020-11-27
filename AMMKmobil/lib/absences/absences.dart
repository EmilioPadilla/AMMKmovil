
class Absences{
  final int id;
  final int idEmpleado;
  final String nombreCompleto;
  final String motivoAusencia;
  final String urlArchivo;
  final String fecha;

  Absences({this.id, this.idEmpleado, this.nombreCompleto, this.motivoAusencia, this.urlArchivo, this.fecha});

  factory Absences.fromJson(Map<String, dynamic> json) {
    return Absences(
      id: json['id'] as int,
      idEmpleado: json['employees_id'] as int,
      nombreCompleto: json['nombreCompleto'] as String,
      motivoAusencia: json['motivoAusencia'] as String,
      urlArchivo: json['urlArchivo'] as String,
      fecha: json['fecha'] as String,
    );
  }
}
