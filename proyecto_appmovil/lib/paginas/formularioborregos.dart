import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class formularioborregos extends StatefulWidget {
  const formularioborregos({Key? key}) : super(key: key);

  @override
  State<formularioborregos> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<formularioborregos> {
  final _url = Uri.parse('https://mivetapi.somee.com/api/animal/gen/?raza=102');
  final _url2 = Uri.parse(
      'https://mivetapi.somee.com/api/animal/'); /*'https://10.0.2.2:7169/api/animal/gen'*/ //'https://jsonplaceholder.typicode.com/todos/1'
  final headers = {"content-type": "application/json;charset=UTF-8"};
  late Future<List<Animales>> animales;
  final raza = TextEditingController();
  final apodo = TextEditingController();
  final nacimiento = TextEditingController();
  final peso = TextEditingController();
  final genero = TextEditingController();
  final estado = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("USA"), value: "108"),
      const DropdownMenuItem(child: Text("Canada"), value: "109"),
    ];
    return menuItems;
  }

  String selectedValue = "USA";

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
            title: const Text("Agregar Gallo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton(
                  value: selectedValue,
                  items: dropdownItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item, style: TextStyle(fontSize: 24)),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedValue = item),
                ),
                TextField(
                  controller: raza,
                  decoration: const InputDecoration(hintText: "Raza"),
                ),
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
                TextField(
                  controller: genero,
                  decoration: const InputDecoration(hintText: "Genero"),
                ),
                TextField(
                  controller: estado,
                  decoration: const InputDecoration(hintText: "Estado"),
                ),
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
    jsonData.forEach((element) {
      final Animales animals = Animales.fromJson(element);
      ;
      animales.add(animals);
    });
    return animales;
  }

  void _addAnimales() async {
    final animal = {
      "raza": raza.text,
      "apodo": apodo.text,
      "nacimiento": nacimiento.text,
      "peso": peso.text,
      "genero": genero.text,
      "estado": estado.text
    };

    await http.post(_url2, headers: headers, body: jsonEncode(animal));
    raza.clear();
    apodo.clear();
    nacimiento.clear();
    peso.clear();
    genero.clear();
    estado.clear();
    setState(() {
      animales = _getAnimales();
    });
  }
}
