import 'dart:convert';

List<AnimalesPost> genFromJson(String str) => List<AnimalesPost>.from(
    json.decode(str).map((x) => AnimalesPost.fromJson(x)));

String genToJson(List<AnimalesPost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimalesPost {
  int id;
  int raza;
  String apodo;
  DateTime nacimiento;
  String peso;
  bool genero;
  int estado;

  factory AnimalesPost.fromJson(Map<String, dynamic> json) => AnimalesPost(
        id: json["id"],
        raza: json["raza"],
        apodo: json["apodo"],
        nacimiento: DateTime.parse(json["nacimiento"]),
        peso: json["peso"],
        genero: json["genero"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "raza": raza,
        "apodo": apodo,
        "nacimiento": nacimiento.toIso8601String(),
        "peso": peso,
        "genero": genero,
        "estado": estado,
      };

  AnimalesPost({
    required this.id,
    required this.raza,
    required this.apodo,
    required this.nacimiento,
    required this.peso,
    required this.genero,
    required this.estado,

    /*factory Animales.fromJson(Map json) {
    return Animales(
        id: json["id"],
        especie: Especie.fromJson(json["especie"]),
        apodo: json["apodo"],
        nacimiento: DateTime.parse(json["nacimiento"]),
        peso: json["peso"],
        genero: json["genero"],
        estado: json["estado"],
        padre: Padre.fromJson(json["padre"]),
        pata: Pata.fromJson(json["pata"]));
  }*/
  });
}
