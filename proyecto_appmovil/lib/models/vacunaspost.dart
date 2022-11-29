import 'dart:convert';

List<Vacunaspost> genFromJson(String str) => List<Vacunaspost>.from(
    json.decode(str).map((x) => Vacunaspost.fromJson(x)));

String genToJson(List<Vacunaspost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vacunaspost {
  int id;
  int animal;
  int vacuna;
  int veterinario;
  String evidencia;
  DateTime? fechaAplicacion;
  bool listo;

  factory Vacunaspost.fromJson(Map<String, dynamic> json) => Vacunaspost(
        id: json["id"],
        animal: json["animal"],
        vacuna: json["vacuna"],
        veterinario: json["veterinario"],
        evidencia: json["evidencia"],
        fechaAplicacion: DateTime.parse(json["fechaaplicacion"]),
        listo: json["listo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "animal": animal,
        "vacuna": vacuna,
        "veterinario": veterinario,
        "evidencia": evidencia,
        "fechaaplicacion": fechaAplicacion?.toIso8601String(),
        "listo": listo
      };

  Vacunaspost({
    required this.id,
    required this.animal,
    required this.vacuna,
    required this.veterinario,
    required this.evidencia,
    required this.fechaAplicacion,
    required this.listo,
  });
}
