import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/models/razas.dart';
import 'package:proyecto_appmovil/models/vacuna.dart';
import 'package:proyecto_appmovil/models/vacunaspost.dart';

// ignore: camel_case_types
class crearraza extends StatefulWidget {
  crearraza({
    super.key,
    required this.id,
  });
  final String? id;

  State<crearraza> createState() => _listState();
}

class _listState extends State<crearraza> {
  late Future<List<Raza>> raza;

  String? idanimal = "";

  final _url2 = Uri.parse('https://www.vetapi.somee.com/api/raza');

  final razanombre = TextEditingController();
  @override
  void initState() {
    idanimal = widget.id;
    super.initState();
    raza = _getRazas();
  }

  Future<List<Raza>> _getRazas() async {
    final response = await http.get(Uri.parse(
        'https://www.vetapi.somee.com/api/Raza/pro?Especie=$idanimal'));
    print(response);
    final jsonData = List.from(jsonDecode(response.body));

    List<Raza> razas = [];
    jsonData.forEach((element) {
      final Raza raz = Raza.fromJson(element);
      razas.add(raz);
    });
    return razas.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Razas'),
      ),
      body: FutureBuilder<List<Raza>>(
        future: raza,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snap.data![i].nombre),
                      )
                    ],
                  );
                });
          }
          if (snap.hasData) {
            return const Center(
              child: Text("Sin Registros"),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: showForm,
        child: const Text("Agregar Raza"),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Agregar Raza"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: razanombre,
                  decoration:
                      const InputDecoration(hintText: "Nombre de la raza"),
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
                  _addRaza();
                  //_addVacunaCaballos();
                  Navigator.of(context).pop();
                },
                child: const Text("Guardar"),
              )
            ],
          );
        });
  }

  void _addRaza() async {
    final razapost = {
      "especie": int.parse(idanimal!),
      "nombre": razanombre.text,
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(razapost));
    setState(() {
      raza = _getRazas();
    });
  }
}
