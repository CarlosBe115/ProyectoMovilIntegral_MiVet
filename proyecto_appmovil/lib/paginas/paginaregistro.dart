import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/paginas/formularioborregos.dart';
import 'package:proyecto_appmovil/paginas/formulariocaballos.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';

class PaginaRegistro extends StatelessWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Animales'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                child: const Text('Lista de Caballos Registrados'),
                onPressed: () {
                  //jasjajsas
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const formulariocaballos()));
                },
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                child: const Text('Lista de Gallos Registrados'),
                onPressed: () {
                  //jasjajsas
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const formulariogallo()));
                },
              ),
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                child: const Text('Lista de Borregos Registrados'),
                onPressed: () {
                  //jasjajsas
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const formularioborregos()));
                },
              ),
            ],
          ),
        ));
  }
}
