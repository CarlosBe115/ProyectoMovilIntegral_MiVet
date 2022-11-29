/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/models/vacuna.dart';
import 'package:proyecto_appmovil/models/vacunaspost.dart';

// ignore: camel_case_types
class sinvacuna extends StatefulWidget {
  sinvacuna({
    super.key,
    required this.id,
    required this.apodo,
    required this.especie,
  });
  final String? id;
  final String? apodo;
  final int? especie;

  State<sinvacuna> createState() => _listState();
}

class _listState extends State<sinvacuna> {
  late Future<List<Animales>> animales;
  late Future<List<Vacuna>> vacunas;

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
                              DateFormat.yMMMEd().format(snap.data![i].fecha))),
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
    );
  }

  @override
  void initState() {
    super.initState();
    animales = _getAnimalFiltro1();
    vacunas = _getAnimalFiltro2();
  }

  Future<List<Animales>> _getAnimalFiltro1() async {
    final response1 =
        await http.get(Uri.parse('https://mivetapi.somee.com/api/animal/pro'));
    final jsonData1 = List.from(jsonDecode(response1.body));

    final response2 =
        await http.get(Uri.parse('https://mivetapi.somee.com/api/Vacuna'));
    final jsonData2 = List.from(jsonDecode(response2.body));

    List Filtro = [];
    for (int i = 0; i < jsonData1.length;i ++){
      for(int j = 0; j < jsonData2.length; j ++){
        if (jsonData1.){}
      }
    } 
    List<Animales> animales = [];
    jsonData1.forEach((element) {
      final Animales animals = Animales.fromJson(element);
      animales.add(animals);
    });
    return animales;
  }

  Future<List<Vacuna>> _getAnimalFiltro2() async {
    List<Vacuna> vacuna = [];
    jsonData2.forEach((element) {
      final Vacuna vac = Vacuna.fromJson(element);
      vacuna.add(vac);
    });

    return vacuna;
  }
}*/
