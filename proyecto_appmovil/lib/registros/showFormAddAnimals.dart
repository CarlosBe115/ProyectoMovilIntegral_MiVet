import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/edit%20animals/borregosedit.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/animalespost.dart';
import 'package:proyecto_appmovil/models/razas.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';
import 'package:proyecto_appmovil/vacunas/vacunaborregos.dart';

// ignore: camel_case_types
class ShowAdd extends StatefulWidget {
  const ShowAdd({
    super.key,
    required this.id,
  });
  final String? id;

  @override
  State<ShowAdd> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<ShowAdd> {
  var selectedrz;
  //GET RAZAS

  final _url2 = Uri.parse('https://www.vetapi.somee.com/api/animal');

  late Future<List<Animales>> animales;
  late Future<List<AnimalesPost>> animalespost;
  late Future<List<Raza>> raza;

  String? idanimal = "";
  String? razagt;
  int especie = 0;

  //String raza = "";
  final apodo = TextEditingController();
  //final nacimiento = TextEditingController();
  final peso = TextEditingController();
  String genero = "";
  String estado = "";

  //razas de borregos
  int razaSantaInes = 108;
  int razaDorper = 109;
  int razaBlackBelly = 110;
  int razaWhiteDorper = 111;
  //generos
  String femenino = "false";
  String masculino = "true";
  //estados
  int vivo = 1;
  int muerto = 2;
  int vendido = 3;

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: '$razaSantaInes', child: const Text("Raza Santa Ines")),
      DropdownMenuItem(value: '$razaDorper', child: const Text("Raza Dorper")),
      DropdownMenuItem(
          value: '$razaBlackBelly', child: const Text("Raza Black Belly")),
      DropdownMenuItem(
          value: '$razaWhiteDorper', child: const Text("Raza White Dorper")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownGen {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'false', child: Text("Hembra")),
      const DropdownMenuItem(value: 'true', child: Text("Macho")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownEstado {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: '$vivo', child: const Text("Vivo")),
      DropdownMenuItem(value: '$muerto', child: const Text("Muerto")),
      DropdownMenuItem(value: '$vendido', child: const Text("Vendido")),
    ];
    return menuItems;
  }

  String selectedValue = "Selecciona";
  String? gender;
  int? datasenda = 0;
  String? datasend = "";
  String? date = "";
  String? genero2 = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Animales'),
      ),
      body: FutureBuilder<List<Raza>>(
        future: raza,
        builder: (context, snap) {
          if (snap.hasData) {
            return Column(
              children: [
                DropdownButton<String>(
                  hint: const Text("Seleccionar Raza"),
                  value: selectedrz,
                  onChanged: (newValue) {
                    setState(() {
                      selectedrz = newValue;
                    });
                  },
                  items: snap.data!.map((e) {
                    return DropdownMenuItem<String>(
                      child: Text(e.nombre),
                      value: e.id.toString(),
                    );
                  }).toList(),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                  child: TextField(
                    controller: apodo,
                    decoration:
                        const InputDecoration(hintText: "Apodo del animal"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                  child: TextField(
                    controller: peso,
                    decoration: const InputDecoration(hintText: "Peso"),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                  child: DropdownButtonFormField(
                    hint: const Text("Seleccionar Género"),
                    onChanged: (
                      String? newValue,
                    ) {
                      setState(() {
                        selectedValue = newValue!;
                        genero = newValue.toString();
                      });
                    },
                    items: dropdownGen,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 30),
                  child: DropdownButtonFormField(
                      hint: const Text("Seleccionar Estado"),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          estado = newValue.toString();
                        });
                      },
                      items: dropdownEstado),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancelar"),
                ),
                TextButton(
                  onPressed: () {
                    _addAnimales();
                    Navigator.of(context).pop();
                  },
                  child: const Text("Guardar"),
                )
              ],
            );
          }
          if (snap.hasError) {
            return const Center(
              child: Text("Sin Registros"),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }

  @override
  void initState() {
    idanimal = widget.id;
    /*_apodo = widget.apodo;
    especie = widget.especie;
    date = widget.nacimiento;*/
    super.initState();
    animales = _getAnimales();
    raza = _getRaza1();
  }

  Future<List<Raza>> _getRaza1() async {
    final response = await http.get(Uri.parse(
        'https://www.vetapi.somee.com/api/raza/pro/?especie=$idanimal'));
    final jsonData = List.from(jsonDecode(response.body));

    List<Raza> razasgt = [];
    // ignore: avoid_function_literals_in_foreach_calls
    jsonData.forEach((element) {
      final Raza razasgg = Raza.fromJson(element);
      razasgt.add(razasgg);
    });
    return razasgt;
  }

  Future<List<Animales>> _getAnimales() async {
    final response = await http.get(Uri.parse(
        'https://www.vetapi.somee.com/api/animal/gen/?raza=$idanimal'));
    final jsonData = List.from(jsonDecode(response.body));

    List<Animales> animales = [];
    // ignore: avoid_function_literals_in_foreach_calls
    jsonData.forEach((element) {
      final Animales animals = Animales.fromJson(element);
      animales.add(animals);
    });
    return animales.reversed.toList();
  }

  void _addAnimales() async {
    final animalespost = {
      "raza": selectedrz,
      "apodo": apodo.text,
      //"nacimiento": nacimiento.text,
      "peso": peso.text,
      "genero": genero.toString(),
      "estado": int.parse(estado)
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(animalespost));
    apodo.clear();
    //nacimiento.clear();
    peso.clear();
  }
}
