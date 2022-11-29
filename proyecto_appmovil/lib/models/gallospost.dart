import 'dart:convert';

List<Gallospost> genFromJson(String str) =>
    List<Gallospost>.from(json.decode(str).map((x) => Gallospost.fromJson(x)));

String genToJson(List<Gallospost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Gallospost {
  int id;
  int raza;
  String apodo;
  //DateTime nacimiento;
  String peso;
  String genero;
  int estado;
  int madre;
  int padre;
  bool rizquierda;
  bool rcentro;
  bool rderecha;
  bool lizquierda;
  bool lcentro;
  bool lderecha;

  factory Gallospost.fromJson(Map<String, dynamic> json) => Gallospost(
        id: json["id"],
        raza: json["raza"],
        apodo: json["apodo"],
        //nacimiento: DateTime.parse(json["nacimiento"]),
        peso: json["peso"],
        genero: json["genero"],
        estado: json["estado"],
        madre: json["madre"],
        padre: json["padre"],
        rizquierda: json["rizquierda"],
        rcentro: json["rcentro"],
        rderecha: json["rderecha"],
        lizquierda: json["lizquierda"],
        lcentro: json["lcentro"],
        lderecha: json["lderecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "raza": raza,
        "apodo": apodo,
        //"nacimiento": nacimiento.toIso8601String(),
        "peso": peso,
        "genero": genero,
        "estado": estado,
        "madre": madre,
        "padre": padre,
        "rizquierda": rizquierda,
        "rcentro": rcentro,
        "rderecha": rderecha,
        "lizquierda": lizquierda,
        "lcentro": lcentro,
        "lderecha": lderecha,
      };

  Gallospost(
      {required this.id,
      required this.raza,
      required this.apodo,
      //required this.nacimiento,
      required this.peso,
      required this.genero,
      required this.estado,
      required this.madre,
      required this.padre,
      required this.rizquierda,
      required this.rcentro,
      required this.rderecha,
      required this.lizquierda,
      required this.lcentro,
      required this.lderecha});
}
