import 'dart:convert';

List<PostEspecie> genFromJson(String str) => List<PostEspecie>.from(
    json.decode(str).map((x) => PostEspecie.fromJson(x)));

String genToJson(List<PostEspecie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostEspecie {
  int id;
  String nombre;

  factory PostEspecie.fromJson(Map<String, dynamic> json) => PostEspecie(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  PostEspecie({
    required this.id,
    required this.nombre,
  });
}
