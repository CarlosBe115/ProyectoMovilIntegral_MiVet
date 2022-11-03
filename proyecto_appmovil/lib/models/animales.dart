class Animales {
  String id;
  int raza;
  String apodo;
  int nacimiento;
  int peso;
  bool genero;
  int estado;

  Animales(
      {required this.id,
      required this.raza,
      required this.apodo,
      required this.nacimiento,
      required this.peso,
      required this.genero,
      required this.estado});

  factory Animales.fromJson(Map json) {
    return Animales(
        id: json["id"],
        raza: json["raza"],
        apodo: json["apodo"],
        nacimiento: json["nacimiento"],
        peso: json["peso"],
        genero: json["genero"],
        estado: json["estado"]);
  }
}
