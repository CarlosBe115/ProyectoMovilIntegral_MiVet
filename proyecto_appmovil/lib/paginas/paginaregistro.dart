import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/paginas/formularioborregos.dart';
import 'package:proyecto_appmovil/paginas/formulariocaballos.dart';
import 'package:proyecto_appmovil/paginas/formulariogallo.dart';

class PaginaRegistro extends StatelessWidget {
  const PaginaRegistro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Center(
      child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(16.0)),
          ElevatedButton(
            child: Text('Registrar Caballo'),
            onPressed: () {
              //jasjajsas
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => formulariocaballos()));
            },
          ),
          Padding(padding: EdgeInsets.all(16.0)),
          ElevatedButton(
            child: Text('Registrar Gallo'),
            onPressed: () {
              //jasjajsas
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => formulariogallo()));
            },
          ),
          Padding(padding: EdgeInsets.all(16.0)),
          ElevatedButton(
            child: Text('Registrar Borrego'),
            onPressed: () {
              //jasjajsas
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => formularioborregos()));
            },
          ),
        ],
      ),
    ));
  }
}
