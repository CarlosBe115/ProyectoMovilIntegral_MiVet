import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/paginas/admin.dart';
import 'package:proyecto_appmovil/paginas/paginahome.dart';

import 'package:proyecto_appmovil/paginas/paginaregistro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _paginaActual = 1;

  final List<Widget> _paginas = [
    const PaginaRegistro(),
    const PaginaHome(),
    const adminanimals(),
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
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.list_outlined), label: "Lista"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.admin_panel_settings_rounded), label: "Admin"),
          ],
        ),
      ),
    );
  }
}
