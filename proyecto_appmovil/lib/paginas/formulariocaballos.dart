import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class formulariocaballos extends StatefulWidget {
  const formulariocaballos({Key? key}) : super(key: key);

  @override
  State<formulariocaballos> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<formulariocaballos> {
  final _url = Uri.parse(
      'https://mivetapi.somee.com/api/animal/gen/?raza=101' /*'https://10.0.2.2:7169/api/animal/gen'*/); //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<Animales>> animales;
  final apodo = TextEditingController();
  final especie = TextEditingController();
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
              children: const [
                TextField(
                  decoration: InputDecoration(hintText: "Apodo"),
                ),
                TextField(
                  decoration: InputDecoration(hintText: "Especie"),
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
}
