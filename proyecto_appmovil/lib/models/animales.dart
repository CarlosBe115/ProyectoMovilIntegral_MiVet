import 'dart:convert';

List<Animales> genFromJson(String str) =>
    List<Animales>.from(json.decode(str).map((x) => Animales.fromJson(x)));

String genToJson(List<Animales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Animales {
  int id;
  //Especie especie;
  String apodo;
  DateTime nacimiento;
  String peso;
  bool genero;
  int estado;
  //Padres padre;
  //Pata pata;

  factory Animales.fromJson(Map<String, dynamic> json) => Animales(
        id: json["id"],
        //especie: Especie.fromJson(json["especie"]),
        apodo: json["apodo"],
        nacimiento: DateTime.parse(json["nacimiento"]),
        peso: json["peso"],
        genero: json["genero"],
        estado: json["estado"],
        //padre: Padres.fromJson(json["padre"]),
        //pata: Pata.fromJson(json["pata"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        //"especie": especie.toJson(),
        "apodo": apodo,
        "nacimiento": nacimiento.toIso8601String(),
        "peso": peso,
        "genero": genero,
        "estado": estado,
        //"padre": padre.toJson(),
        //"pata": pata.toJson(),
      };

  Animales({
    required this.id,
    //required this.especie,
    required this.apodo,
    required this.nacimiento,
    required this.peso,
    required this.genero,
    required this.estado,
    //required this.padre,
    //required this.pata
  });

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
}

/*class Especie {
  int id;
  String raza;
  int idEspecie;
  String especie;

  Especie({
    required this.id,
    required this.raza,
    required this.idEspecie,
    required this.especie,
  });

  factory Especie.fromJson(Map<String, dynamic> json) => Especie(
        id: json["id"],
        raza: json["raza"],
        idEspecie: json["idEspecie"],
        especie: json["especie"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "raza": raza,
        "idEspecie": idEspecie,
        "especie": especie,
      };
}*/

/*class Padres {
  int id;
  int madre;
  int padre;

  Padres({
    required this.id,
    required this.madre,
    required this.padre,
  });

  factory Padres.fromJson(Map<String, dynamic> json) => Padres(
        id: json["id"],
        madre: json["madre"],
        padre: json["padre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "madre": madre,
        "padre": padre,
      };
}*/

 /*class Pata {
  int id;
  bool rizquierda;
  bool rcentro;
  bool rderecha;
  bool lizquierda;
  bool lcentro;
  bool lderecha;

 Pata({
    required this.id,
    required this.rizquierda,
    required this.rcentro,
    required this.rderecha,
    required this.lizquierda,
    required this.lcentro,
    required this.lderecha,
  });

  factory Pata.fromJson(Map<String, dynamic> json) => Pata(
        id: json["id"],
        rizquierda: json["rizquierda"],
        rcentro: json["rcentro"],
        rderecha: json["rderecha"],
        lizquierda: json["lizquierda"],
        lcentro: json["lcentro"],
        lderecha: json["lderecha"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rizquierda": rizquierda,
        "rcentro": rcentro,
        "rderecha": rderecha,
        "lizquierda": lizquierda,
        "lcentro": lcentro,
        "lderecha": lderecha,
      };
}*/

