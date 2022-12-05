import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/models/animalesinvacuna.dart';
import 'package:proyecto_appmovil/models/vacuna.dart';
import 'package:proyecto_appmovil/models/vacunaspost.dart';

// ignore: camel_case_types
class sinvacuna extends StatefulWidget {
  sinvacuna({Key? key}) : super(key: key);

  State<sinvacuna> createState() => _listState();
}

class _listState extends State<sinvacuna> {
  late Future<List<Animalesinvacuna>> animales;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Vacunas'),
      ),
      body: FutureBuilder<List<Animalesinvacuna>>(
        future: animales,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                          title: Text(snap.data![i].apodo),
                          subtitle: const Text("Necesita Vacuna")),
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
    animales = _getAnimalSinVacuna();
  }

  Future<List<Animalesinvacuna>> _getAnimalSinVacuna() async {
    final response = await http.get(
        Uri.parse('https://www.vetapi.somee.com/api/VacunaAnimal/sinvacuna'));
    final jsonData = List.from(jsonDecode(response.body));
    List<Animalesinvacuna> animales = [];
    jsonData.forEach((element) {
      final Animalesinvacuna animals = Animalesinvacuna.fromJson(element);
      animales.add(animals);
    });
    return animales.reversed.toList();
  }
}
