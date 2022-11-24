import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/animalespost.dart';

// ignore: camel_case_types
class formulariocaballos extends StatefulWidget {
  const formulariocaballos({Key? key}) : super(key: key);

  @override
  State<formulariocaballos> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<formulariocaballos> {
  final _url = Uri.parse('https://mivetapi.somee.com/api/animal/gen/?raza=101');
  final _url2 = Uri.parse(
      'https://mivetapi.somee.com/api/animal'); /*'https://10.0.2.2:7169/api/animal/gen'*/ //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<Animales>> animales;
  late Future<List<AnimalesPost>> animalespost;

  String raza = "";
  final apodo = TextEditingController();
  final nacimiento = TextEditingController();
  final peso = TextEditingController();
  String genero = "";
  String estado = "";
  //razas de caballos
  int razaAndaluz = 105;
  int razaArabe = 106;
  int razaPelibuey = 107;
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
          value: '$razaAndaluz', child: const Text("Raza Andaluz")),
      DropdownMenuItem(value: '$razaArabe', child: const Text("Raza Arabe")),
      DropdownMenuItem(
          value: '$razaPelibuey', child: const Text("Raza Pelibuey")),
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
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snap.data![i].apodo),
                        subtitle: Text(snap.data![i].especie!.especie),
                      ),
                      const Divider()
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
      floatingActionButton: FloatingActionButton(
        onPressed: showForm,
        child: const Icon(Icons.add),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Agregar Caballo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField(
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                        raza = newValue;
                      });
                    },
                    items: dropdownItems),
                TextField(
                  controller: apodo,
                  decoration: const InputDecoration(hintText: "Apodo"),
                ),
                TextField(
                  controller: nacimiento,
                  decoration: const InputDecoration(hintText: "Nacimiento"),
                ),
                TextField(
                  controller: peso,
                  decoration: const InputDecoration(hintText: "Peso"),
                ),
                //genero
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
                //estado
                DropdownButtonFormField(
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                        estado = newValue.toString();
                      });
                    },
                    items: dropdownEstado),
              ],
            ),
            actions: [
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
        });
  }

  @override
  void initState() {
    super.initState();
    animales = _getAnimales();
  }

  Future<List<Animales>> _getAnimales() async {
    final response = await http.get(_url);
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
      "raza": int.parse(raza),
      "apodo": apodo.text,
      "nacimiento": nacimiento.text,
      "peso": peso.text,
      "genero": genero.toString(),
      "estado": int.parse(estado)
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(animalespost));
    apodo.clear();
    nacimiento.clear();
    peso.clear();
    setState(() {
      animales = _getAnimales();
    });
  }
}
