import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'package:proyecto_appmovil/models/gallospost.dart';

// ignore: camel_case_types
class registrogallos extends StatefulWidget {
  const registrogallos({Key? key}) : super(key: key);

  @override
  State<registrogallos> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<registrogallos> {
  final _url2 = Uri.parse('https://mivetapi.somee.com/api/animal/sup');
  late Future<List<Animales>> animales;
  late Future<List<Gallospost>> gallospost;
  String raza = "";
  final apodo = TextEditingController();
  final nacimiento = TextEditingController();
  final peso = TextEditingController();
  String genero = "";
  String estado = "";
  int madre = 0;
  int padre = 0;
  //marcas dedo izquierdo
  bool? lizquierda = false;
  bool? lcentro = false;
  bool? lderecha = false;
  //marcas dedo derecho
  bool? rderecha = false;
  bool? rcentro = false;
  bool? rizquierda = false;

  //razas de gallos
  int razaJerseyGigante = 100;
  int razaRhodeIslandRed = 101;
  int razaSussex = 102;
  int razaCornish = 103;
  int razaCobb = 104;
  //generos
  String femenino = "false";
  String masculino = "true";
  //estados
  int vivo = 1;
  int muerto = 2;
  int vendido = 3;
  //MARCAS PATA IZQUIERDA
  String marcard1izquierda = "true";
  String marcard1derecho = "true";
  String marcard1centro = "true";
  //MARCAS PATA DERECHA
  String marcard2izquierda = "true";
  String marcard2centro = "true";
  String marcard2derecha = "true";

  //seleccionador de raza
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: '$razaJerseyGigante', child: const Text("Raza Jersy Gigante")),
      DropdownMenuItem(
          value: '$razaRhodeIslandRed',
          child: const Text("Raza Rhode Island Red")),
      DropdownMenuItem(value: '$razaSussex', child: const Text("Raza Sussex")),
      DropdownMenuItem(
          value: '$razaCornish', child: const Text("Raza Cornish")),
      DropdownMenuItem(value: '$razaCobb', child: const Text("Raza Cobb")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownGen {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'false', child: Text("Hembra")),
      const DropdownMenuItem(value: 'true', child: Text("Macho")),
    ];
    return menuItems;
  }

  //seleccionador de estado
  List<DropdownMenuItem<String>> get dropdownEstado {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(value: '$vivo', child: const Text("Vivo")),
      DropdownMenuItem(value: '$muerto', child: const Text("Muerto")),
      DropdownMenuItem(value: '$vendido', child: const Text("Vendido")),
    ];
    return menuItems;
  }

  String selectedValue = "Selecciona";
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Gallos'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  DropdownButtonFormField(
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!;
                          raza = newValue;
                        });
                      },
                      items: dropdownItems),
                  TextField(
                    controller: apodo,
                    decoration: const InputDecoration(hintText: "Apodo"),
                  ),

                  TextField(
                    controller: nacimiento,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calendar_today_rounded),
                        labelText: "Nacimiento"),
                    onTap: () async {
                      DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1999),
                          lastDate: DateTime(2100));
                      if (pickeddate != null) {
                        setState(() {
                          nacimiento.text =
                              DateFormat('yyyy-MM-dd').format(pickeddate);
                        });
                      }
                    },
                  ),
                  TextField(
                    controller: peso,
                    decoration: const InputDecoration(hintText: "Peso"),
                  ),
                  //genero
                  DropdownButtonFormField(
                    onChanged: (
                      String? newValue,
                    ) {
                      setState(() {
                        selectedValue = newValue!;
                        genero = newValue.toString();
                      });
                    },
                    items: dropdownGen,
                  ),
                  //eleccion de patas izquierda
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Marca en Pata Izquierda",
                        style: TextStyle(fontSize: 18),
                      ),
                      CheckboxListTile(
                        title: const Text("Izquierda"),
                        value: lizquierda,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            lizquierda = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Central"),
                        value: lcentro,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            lcentro = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: const Text("Derecha"),
                        value: lderecha,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            lderecha = value;
                          });
                        },
                      ),
                      //marcas en pata derecha
                      const Text(
                        "Marca en Pata Derecha",
                        style: TextStyle(fontSize: 18),
                      ),
                      CheckboxListTile(
                        title: const Text("Izquierda"),
                        value: rizquierda,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            rizquierda = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                          title: const Text("Central"),
                          value: rcentro,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (bool? value) {
                            setState(() {
                              rcentro = value;
                            });
                          }),
                      CheckboxListTile(
                        title: const Text("Derecha"),
                        value: rderecha,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (bool? value) {
                          setState(() {
                            rderecha = value;
                          });
                        },
                      ),
                      //estado
                      DropdownButtonFormField(
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedValue = newValue!;
                              estado = newValue.toString();
                            });
                          },
                          items: dropdownEstado),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextButton(
                        onPressed: () {},
                        child: const Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () {
                          _addAnimales();
                        },
                        child: const Text("Guardar"),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  void _addAnimales() async {
    final gallospost = {
      "raza": int.parse(raza),
      "apodo": apodo.text,
      "nacimiento": nacimiento.text,
      "peso": peso.text,
      "genero": genero.toString(),
      "estado": int.parse(estado),
      "madre": madre,
      "padre": padre,
      "rizquierda": rizquierda,
      "rcentro": rcentro,
      "rderecha": rderecha,
      "lizquierda": lizquierda,
      "lcentro": lcentro,
      "lderecha": lderecha,
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(gallospost));
    apodo.clear();
    nacimiento.clear();
    peso.clear();
  }
}
