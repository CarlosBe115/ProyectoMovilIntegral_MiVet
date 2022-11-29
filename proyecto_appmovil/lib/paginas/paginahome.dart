import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/paginas/correo.dart';
import 'package:proyecto_appmovil/paginas/formularioborregos.dart';
import 'package:proyecto_appmovil/paginas/formulariocaballos.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';

class PaginaHome extends StatelessWidget {
  const PaginaHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mi Vet'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(16.0)),
              ElevatedButton(
                child: const Text('Sin Vacuna'),
                onPressed: () {
                  //jasjajsas
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const formulariocaballos()));
                },
              ),
              ElevatedButton(
                child: const Text('Solicitar Cita'),
                onPressed: () {
                  //jasjajsas
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const correo()));
                },
              ),
              /*const Padding(padding: EdgeInsets.all(16.0)),
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
              ),*/
            ],
          ),
        ));
  }
}
