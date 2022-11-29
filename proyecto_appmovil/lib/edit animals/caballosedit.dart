import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/paginas/formularioborregos.dart';
import 'package:proyecto_appmovil/paginas/formulariocaballos.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';

// ignore: camel_case_types
class caballosedit extends StatefulWidget {
  caballosedit({
    super.key,
    required this.id,
    required this.apodo,
    // required this.nacimiento,
    required this.especie,
  });
  final String? id;
  final String? apodo;
  final int? especie;
  // final String? nacimiento;

  State<caballosedit> createState() => _listState();
}

class _listState extends State<caballosedit> {
  late Future<List<Animales>> animales;
  String? idanimal = "";
  String? _apodo = "";
  final peso = TextEditingController();
  String? genero = "";
  int? especie = 0;
  String? date = "";

  //estados
  int vivo = 1;
  int muerto = 2;
  int vendido = 3;
  //seleccionador de estado
  List<DropdownMenuItem<String>> get dropdownEstado {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: '$vivo', child: const Text("Vivo")),
      DropdownMenuItem(value: '$muerto', child: const Text("Muerto")),
      DropdownMenuItem(value: '$vendido', child: const Text("Vendido")),
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

  String selectedValue = "Selecciona";
  String estado = "";
  @override
  void initState() {
    idanimal = widget.id;
    _apodo = widget.apodo;
    especie = widget.especie;
    //date = widget.nacimiento;
    super.initState();
    animales = _getAnimales1();
  }

  Future<List<Animales>> _getAnimales1() async {
    final response = await http.get(
        Uri.parse('https://mivetapi.somee.com/api/animal/gen/?id=$idanimal'));
    print(response);
    final jsonData = List.from(jsonDecode(response.body));

    List<Animales> animales = [];
    jsonData.forEach((element) {
      final Animales animals = Animales.fromJson(element);
      animales.add(animals);
    });
    return animales;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Animales'),
      ),
      body: FutureBuilder<List<Animales>>(
        future: animales,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      const Text(
                        "Editar Peso",
                        style: TextStyle(fontSize: 18),
                      ),
                      TextField(
                        controller: peso,
                        decoration:
                            InputDecoration(hintText: snap.data![i].peso),
                      ),
                      const Divider(),
                      const Text(
                        "Editar Estado del Animal",
                        style: TextStyle(fontSize: 18),
                      ),
                      DropdownButtonFormField(
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                              estado = newValue.toString();
                            });
                          },
                          items: dropdownEstado),
                      DropdownButtonFormField(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              _putAnimales();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const formulariocaballos()));
                            },
                            child: const Text("Actualizar información"),
                          ),
                        ],
                      )
                    ],
                  );
                });
          }
          if (snap.hasError) {
            return const Center(
              child: Text("Sin Registros"),
            );
          }
          return const CircularProgressIndicator();
        },

        /*child: ElevatedButton(
          child: Text('Regresar'),
          onPressed: () {
            //jasjajsas
          },
        ),*/
      ),
    );
  }

  void _putAnimales() async {
    final gallosput = {
      "id": int.parse(idanimal!),
      "raza": especie,
      "apodo": _apodo,
      "nacimiento": date,
      "peso": peso.text,
      "genero": genero,
      "estado": int.parse(estado),
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.put(Uri.parse("https://mivetapi.somee.com/api/Animal"),
        headers: headers, body: jsonEncode(gallosput));
  }
}
