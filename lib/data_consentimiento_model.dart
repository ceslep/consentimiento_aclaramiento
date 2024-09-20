class AclaramientoModel {
  String identificacion;
  String nombre;
  String ciudad;
  String representado;
  String? firma;
  String? dia;
  String? mes;
  String? anio;

  AclaramientoModel(
      {required this.identificacion,
      required this.nombre,
      required this.ciudad,
      required this.representado,
      this.firma,
      this.dia,
      this.mes,
      this.anio});

  // Método para convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'identificacion': identificacion,
      'nombre': nombre,
      'ciudad': ciudad,
      'representado': representado,
      'firma': firma,
      'dia': dia,
      'mes': mes,
      'anio': anio
    };
  }

  // Método para crear una instancia desde JSON
  factory AclaramientoModel.fromJson(Map<String, dynamic> json) {
    return AclaramientoModel(
      identificacion: json['identificacion'],
      nombre: json['nombres'],
      ciudad: json['ciudad'],
      representado: json['apoderado'],
      firma: json['firma'],
      dia: json['dia'],
      mes: json['mes'],
      anio: json['anio'],
    );
  }
}
