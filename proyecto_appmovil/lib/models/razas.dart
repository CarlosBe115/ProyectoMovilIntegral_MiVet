import 'dart:convert';

List<Raza> genFromJson(String str) =>
    List<Raza>.from(json.decode(str).map((x) => Raza.fromJson(x)));

String genToJson(List<Raza> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Raza {
  int id;
  int especie;
  String nombre;

  factory Raza.fromJson(Map<String, dynamic> json) => Raza(
        id: json["id"],
        especie: json["especie"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "especie": especie,
        "nombre": nombre,
      };

  Raza({required this.id, required this.nombre, required this.especie});
}
