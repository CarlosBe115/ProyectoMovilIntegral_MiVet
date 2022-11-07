import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PaginaList extends StatefulWidget {
  const PaginaList({Key? key}) : super(key: key);

  @override
  State<PaginaList> createState() => _formcaballosState();
}

// ignore: camel_case_types
class _formcaballosState extends State<PaginaList> {
  final _url = Uri.parse(
      'https://www.mivetapi.somee.com/api/animal/gen/?id=100000' /*'https://10.0.2.2:7169/api/animal/gen'*/); //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<Animales>> animales;
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
    );
  }

  //final String _url = "https://localhost:7169/api/animal/gen";

  @override
  void initState() {
    super.initState();
    animales = _getAnimales();
  }

  //late Future<List<Animales>> _listadoAnimales;
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
