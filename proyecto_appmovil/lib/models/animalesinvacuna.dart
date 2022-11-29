import 'dart:convert';

List<Animalesinvacuna> genFromJson(String str) => List<Animalesinvacuna>.from(
    json.decode(str).map((x) => Animalesinvacuna.fromJson(x)));

String genToJson(List<Animalesinvacuna> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Animalesinvacuna {
  int id;
  String apodo;

  factory Animalesinvacuna.fromJson(Map<String, dynamic> json) =>
      Animalesinvacuna(
        id: json["id"],
        apodo: json["apodo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "apodo": apodo,
      };
  Animalesinvacuna({
    required this.id,
    required this.apodo,
  });
}
