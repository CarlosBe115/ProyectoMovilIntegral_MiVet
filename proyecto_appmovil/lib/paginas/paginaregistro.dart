import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/edit%20animals/caballosedit.dart';
import 'package:proyecto_appmovil/edit%20animals/gallosedit.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/animalespost.dart';
import 'package:proyecto_appmovil/models/especie.dart';
import 'package:proyecto_appmovil/paginas/crearraza.dart';
import 'package:proyecto_appmovil/paginas/formularioanimal.dart';
import 'package:proyecto_appmovil/paginas/_formc.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';
import 'package:proyecto_appmovil/registros/registrogallos.dart';
import 'package:proyecto_appmovil/registros/showFormAddAnimals.dart';
import 'package:proyecto_appmovil/vacunas/vacunacaballos.dart';

// ignore: camel_case_types
class PaginaRegistro extends StatefulWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
  State<PaginaRegistro> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<PaginaRegistro> {
  final _url = Uri.parse('https://www.vetapi.somee.com/api/especie');
  final _url2 = Uri.parse(
      'https://www.vetapi.somee.com/api/especie'); /*'https://10.0.2.2:7169/api/animal/gen'*/ //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<PostEspecie>> postespecie;
  //late Future<List<Animales>> animal;
  final nombreespecie = TextEditingController();
  int datasenda = 0;
  int idnuevo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Especies'),
      ),
      body: FutureBuilder<List<PostEspecie>>(
        future: postespecie,
        builder: (context, snap) {
          if (snap.hasData) {
            return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(snap.data![i].nombre),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  idnuevo = snap.data![i].id;
                                  if (idnuevo == 100) {
                                    datasenda = snap.data![i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const formulariogallo()));
                                  } else {
                                    datasenda = snap.data![i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                formularioanimal(
                                                  id: snap.data![i].id
                                                      .toString(),
                                                )));
                                  }
                                  datasenda = snap.data![i].id;
                                },
                                icon: const Icon(Icons.assignment)),
                            IconButton(
                                onPressed: () {
                                  idnuevo = snap.data![i].id;
                                  if (idnuevo == 100) {
                                    datasenda = snap.data![i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const registrogallos()));
                                  } else {
                                    datasenda = snap.data![i].id;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowAdd(
                                                  id: snap.data![i].id
                                                      .toString(),
                                                )));
                                  }
                                  datasenda = snap.data![i].id;
                                },
                                icon: const Icon(Icons.add))
                          ],
                        ),
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
                TextField(
                  controller: nombreespecie,
                  decoration:
                      const InputDecoration(hintText: "Nombre de Especie"),
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
                  _addPostEspecies();
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
    postespecie = _getEspecies();
  }

  Future<List<PostEspecie>> _getEspecies() async {
    final response = await http.get(_url);
    final jsonData = List.from(jsonDecode(response.body));

    List<PostEspecie> animal = [];
    // ignore: avoid_function_literals_in_foreach_calls
    jsonData.forEach((element) {
      final PostEspecie animals = PostEspecie.fromJson(element);
      animal.add(animals);
    });
    return animal.reversed.toList();
  }

  void _addPostEspecies() async {
    final especiepost = {
      "nombre": nombreespecie.text,
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(especiepost));
    nombreespecie.clear();
    //nacimiento.clear();
    setState(() {
      postespecie = _getEspecies();
    });
  }
}
