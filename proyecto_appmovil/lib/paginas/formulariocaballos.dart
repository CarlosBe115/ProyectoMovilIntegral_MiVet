import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class formulariocaballos extends StatelessWidget {
  const formulariocaballos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Caballos'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Regresar'),
          onPressed: () {
            //jasjajsas
          },
        ),
      ),
    );
  }
}/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:http/http.dart' as http;

class formulariocaballos extends StatefulWidget {
  const formulariocaballos({Key? key}) : super(key: key);

  @override
  State<formulariocaballos> createState() => _formcaballosState();
}

class _formcaballosState extends State<formulariocaballos> {
  final _url = Uri.parse(
      'https://63635a5666f75177ea424b0f.mockapi.io/Animales' /*'https://10.0.2.2:7169/api/animal/gen'*/); //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<Animales>> animales;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Caballos'),
      ),
      body: FutureBuilder(
        future: animales,
        builder: (context, snap) {
          if (snap.hasData) {
            return const Center(
              child: Text("Datos listos"),
            );
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
    //var uri = Uri.parse(_url);

    final response = await http.get(_url);

    //List<Animales> animales = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);

      final jsonData = List.from(jsonDecode(body));
      List<Animales> animal = [];
      jsonData.forEach((element) {
        final Animales animales = Animales.fromJson(element);
      });
      print(jsonData);
      return animal;
      //for (var item in jsonData["data"]) {
      //  animales.add(item["apodo"]);
    } else {
      throw Exception("Fallo la conexión");
    }
  }
}*/
