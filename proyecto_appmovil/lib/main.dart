import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/paginas/paginahome.dart';
import 'package:proyecto_appmovil/paginas/paginalist.dart';
import 'package:proyecto_appmovil/paginas/paginaregistro.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'models/animales.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 1;

  List<Widget> _paginas = [
    PaginaRegistro(),
    PaginaHome(),
    //PaginaList(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MaterialApp",
      home: Scaffold(
        body: _paginas[_paginaActual],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _paginaActual = index;
            });
          },
          currentIndex: _paginaActual,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: "Lista"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            //BottomNavigationBarItem(icon: Icon(Icons.list_outlined), label: "Lista")
          ],
        ),
      ),
    );
  }
}
