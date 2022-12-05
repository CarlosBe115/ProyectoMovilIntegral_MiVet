import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/edit%20animals/gallosedit.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/gallospost.dart';
import 'package:proyecto_appmovil/registros/registrogallos.dart';
import 'package:proyecto_appmovil/vacunas/vacunagallos.dart';

// ignore: camel_case_types
class formulariogallo extends StatefulWidget {
  const formulariogallo({Key? key}) : super(key: key);

  @override
  State<formulariogallo> createState() => _listState();
}

// ignore: camel_case_types
class _listState extends State<formulariogallo> {
  final _url =
      Uri.parse('https://www.vetapi.somee.com/api/animal/gen/?raza=100');
  final _url2 = Uri.parse(
      'https://mivetapi.somee.com/api/animal/sup'); /*'https://10.0.2.2:7169/api/animal/gen'*/ //'https://jsonplaceholder.typicode.com/todos/1'
  late Future<List<Animales>> animales;
  late Future<List<Gallospost>> gallospost;
  String raza = "";
  final apodo = TextEditingController();
  //final nacimiento = TextEditingController();
  final peso = TextEditingController();
  String genero = "";
  String estado = "";
  int madre = 0;
  int padre = 0;
  //marcas dedo derecho
  String rderecha = "false";
  String rcentro = "false";
  String rizquierda = "false";
  //marcas dedo izquierdo
  String lderecha = "false";
  String lcentro = "false";
  String lizquierda = "false";
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
  //marcas dedo derecho
  bool marcarderecha = true;
  bool marcarderecharcentro = true;
  bool marcarderecharizquierda = true;
  //marcas dedo izquierdo
  bool marcarderechalderecha = true;
  bool marcarderechalcentro = true;
  bool marcarderechalizquierda = true;
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

  //seleccionador de Pata Derecha
  List<DropdownMenuItem<String>> get dropdownPataR {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: '$marcarderecha', child: const Text("Marca Dedo Derecho")),
      DropdownMenuItem(
          value: '$marcarderecharcentro',
          child: const Text("Marca Dedo Central")),
      DropdownMenuItem(
          value: '$marcarderecharizquierda',
          child: const Text("Marca Dedo Izquierdo")),
    ];
    return menuItems;
  }

  //seleccionador de Pata Izuierda
  List<DropdownMenuItem<String>> get dropdownPataL {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          value: '$marcarderechalizquierda',
          child: const Text("Marca Dedo Derecho")),
      DropdownMenuItem(
          value: '$marcarderechalcentro',
          child: const Text("Marca Dedo Central")),
      DropdownMenuItem(
          value: '$marcarderechalizquierda',
          child: const Text("Marca Dedo Izquierdo")),
    ];
    return menuItems;
  }

  String selectedValue = "Selecciona";
  String? gender;
  int? datasenda = 0;
  String? datasend = "";
  int? especie = 0;
  String? date = "";
  String? genero2 = "";

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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  datasenda = snap.data![i].id;
                                  datasend = snap.data![i].apodo;
                                  especie = snap.data![i].especie!.id;
                                  date = snap.data![i].nacimiento.toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => gallosedit(
                                                id: snap.data![i].id.toString(),
                                                /* apodo: snap.data![i].apodo,
                                                  especie:
                                                      snap.data![i].especie!.id,
                                                  nacimiento: snap
                                                      .data![i].nacimiento
                                                      .toString(),*/
                                              )));
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  datasenda = snap.data![i].id;
                                  datasend = snap.data![i].apodo;
                                  especie = snap.data![i].especie!.id;
                                  date = snap.data![i].nacimiento.toString();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => vacunagallos(
                                                id: snap.data![i].id.toString(),
                                                apodo: snap.data![i].apodo,
                                                especie:
                                                    snap.data![i].especie!.id,
                                              )));
                                },
                                icon: const Icon(Icons.medication)),
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
        /*child: ElevatedButton(
          child: Text('Regresar'),
          onPressed: () {
            //jasjajsas
          },
        ),*/
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
                /*TextField(
                  controller: nacimiento,
                  decoration: const InputDecoration(hintText: "Nacimiento"),
                ),*/
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
                    RadioListTile(
                      title: const Text("Dedo Izquierda"),
                      value: "",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Dedo Central"),
                      value: "",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text("Dedo Derecha"),
                      value: "",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value.toString();
                        });
                      },
                    ),
                  ],
                ),
                const Text(
                  "Marca en Pata Derecha",
                  style: TextStyle(fontSize: 18),
                ),
                //marcas en pata derecha
                RadioListTile(
                  title: const Text("Dedo Izquierda"),
                  value: "male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: const Text("Dedo Central"),
                  value: "female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                RadioListTile(
                  title: const Text("Dedo Derecha"),
                  value: "other",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
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
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancelar"),
              ),
              TextButton(
                onPressed: () {
                  _addAnimales();
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
    animales = _getAnimales();
    super.initState();
  }

  Future<List<Animales>> _getAnimales() async {
    final response = await http.get(_url);
    final jsonData = List.from(jsonDecode(response.body));

    List<Animales> animales = [];
    // ignore: avoid_function_literals_in_foreach_calls
    jsonData.forEach((element) {
      final Animales animals = Animales.fromJson(element);
      animales.add(animals);
    });
    return animales.reversed.toList();
  }

  void _addAnimales() async {
    final gallospost = {
      "raza": int.parse(raza),
      "apodo": apodo.text,
      //"nacimiento": nacimiento.text,
      "peso": peso.text,
      "genero": genero.toString(),
      "estado": int.parse(estado),
      "madre": madre,
      "padre": padre,
      "rizquierda": rizquierda.toString(),
      "rcentro": rcentro.toString(),
      "rderecha": rderecha.toString(),
      "lizquierda": lizquierda.toString(),
      "lcentro": lcentro.toString(),
      "lderecha": lderecha.toString(),
    };

    final headers = {"content-type": "application/json;charset=UTF-8"};
    await http.post(_url2, headers: headers, body: jsonEncode(gallospost));
    print(gallospost);
    apodo.clear();
    // nacimiento.clear();
    peso.clear();
    setState(() {
      animales = _getAnimales();
    });
  }
}
