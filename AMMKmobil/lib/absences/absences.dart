
class Absences {
  final int id;
  final int idEmployee;
  final String motivoAusencia;
  final String urlArchivo;
  final String fecha;

  Absences({this.id, this.idEmployee, this.motivoAusencia, this.urlArchivo, this.fecha});

  factory Absences.fromJson(Map<String, dynamic> json) {
    return Absences(
      id: json['id'] as int,
      idEmployee: json['employees_id'] as int,
      motivoAusencia: json['motivoAusencia'] as String,
      urlArchivo: json['urlArchivo'] as String,
      fecha: json['fecha'] as String,
    );
  }
}
