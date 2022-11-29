import 'dart:convert';

import 'package:flutter/material.dart';

List<Vacuna> genFromJson(String str) =>
    List<Vacuna>.from(json.decode(str).map((x) => Vacuna.fromJson(x)));

String genToJson(List<Vacuna> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vacuna {
  int id;
  String animal;
  String vacuna;
  DateTime fecha;
  bool listo;

  factory Vacuna.fromJson(Map<String, dynamic> json) => Vacuna(
        id: json["id"],
        animal: json["animal"],
        vacuna: json["vacuna"],
        fecha: DateTime.parse(json["fecha"]),
        listo: json["listo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "animal": animal,
        "vacuna": vacuna,
        "fecha": fecha.toIso8601String(),
        "listo": listo
      };

  Vacuna({
    required this.id,
    required this.animal,
    required this.vacuna,
    required this.fecha,
    required this.listo,
  });
}
