import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/models/vacuna.dart';
import 'package:proyecto_appmovil/models/vacunaspost.dart';

// ignore: camel_case_types
class vacunacaballos extends StatefulWidget {
  vacunacaballos({
    super.key,
    required this.id,
    required this.apodo,
    required this.especie,
  });
  final String? id;
  final String? apodo;
  final int? especie;

  State<vacunacaballos> createState() => _listState();
}

class _listState extends State<vacunacaballos> {
  final _url2 = Uri.parse('https://mivetapi.somee.com/api/VacunaAnimal');
  late Future<List<Vacuna>> vacunas;
  late Future<List<Vacunaspost>> vacunaspost;
  String? idanimal = "";
  int veterinario = 1000;
  String evidencia = "fotoguardada";
  //final fechaaplicacion = TextEditingController();
  bool listo = false;
  String vacunaseleccionada = "";

  //vacunas para gallos
  int vacuna1 = 102;
  int vacuna2 = 103;
  //seleccionador de vacunas para gallos
  List<DropdownMenuItem<String>> get dropdownVacuna {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: '$vacuna1', child: const Text("Influenza Equina")),
      DropdownMenuItem(value: '$vacuna2', child: const Text("Rinoneumonitis")),
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
    super.initState();
    vacunas = _getVacunaAnimales();
  }

  Future<List<Vacuna>> _getVacunaAnimales() async {
    final response = await http.get(Uri.parse(
        'https://mivetapi.somee.com/api/VacunaAnimal/pro/?animal=$idanimal&listo=false'));
    print(response);
    final jsonData = List.from(jsonDecode(response.body));

    List<Vacuna> vacunas = [];
    jsonData.forEach((element) {
      final Vacuna vac = Vacuna.fromJson(element);
      vacunas.add(vac);
    });
    return vacunas.reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vacunas'),
      ),
      body: FutureBuilder<List<Vacuna>>(
        future: vacunas,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text(snap.data![i].vacuna),
                          subtitle: Text(
                              "Dosis el ${DateFormat.yMMMEd().format(snap.data![i].fecha)}")),
                      const Divider(),
                      const Text(
                        "",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                });
          }
          return const CircularProgressIndicator();
        },
      ),
      floatingActionButton: ElevatedButton(
        onPressed: showForm,
        child: const Text("Agregar Vacuna"),
      ),
    );
  }

  void showForm() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Agregar Vacuna"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField(
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                        vacunaseleccionada = newValue;
                      });
                    },
                    items: dropdownVacuna),
                /*TextField(
                    controller: fechaaplicacion,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_rounded),
                        labelText: "Fecha de Aplicación"),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1999),
                        lastDate: DateTime(2100),
                      );
                      if (pickeddate != null) {
                        setState(() {
                          fechaaplicacion.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    }),*/
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
                  _addVacunaCaballos();
                  Navigator.of(context).pop();
                },
                child: const Text("Guardar"),
              )
            ],
          );
        });
  }

  void _addVacunaCaballos() async {
    final vacunaspost = {
      "animal": int.parse(idanimal!),
      "vacuna": int.parse(vacunaseleccionada),
      "veterinario": veterinario,
      "evidencia": evidencia,
      //"fechaaplicacion": fechaaplicacion.text,
      "listo": listo,
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(vacunaspost));
    setState(() {
      vacunas = _getVacunaAnimales();
    });
  }
}
