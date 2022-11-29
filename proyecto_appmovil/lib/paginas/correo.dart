import 'package:flutter/material.dart';
import 'package:proyecto_appmovil/edit%20animals/gallosedit.dart';
import 'package:proyecto_appmovil/models/animales.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_appmovil/models/gallospost.dart';
import 'package:proyecto_appmovil/paginas/paginahome.dart';
import 'package:proyecto_appmovil/registros/registrogallos.dart';
import 'package:proyecto_appmovil/vacunas/vacunagallos.dart';

// ignore: camel_case_types
class correo extends StatefulWidget {
  const correo({Key? key}) : super(key: key);

  @override
  State<correo> createState() => _listState();
}

final nameController = TextEditingController();
final subjectController = TextEditingController();
String emailController = "carlosandresbe115@gmail.com";
final messageController = TextEditingController();

Future sendemail() async {
  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

  const serviceId = "service_mxnfzql";
  const templateId = "template_zz3sbvv";
  const userId = "97kSTfcE-V6v17wFn";

  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
          "name": nameController.text,
          "subject": subjectController.text,
          "message": messageController.text,
          "user_email": emailController.toString()
        }
      }));
  return response.statusCode;
}

// ignore: camel_case_types
class _listState extends State<correo> {
  List<DropdownMenuItem<String>> get dropdownGen {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: 'false', child: Text("Hembra")),
      const DropdownMenuItem(value: 'true', child: Text("Macho")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Cita'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25.0, 40, 25, 0),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.account_circle),
                hintText: 'Nombre',
                labelText: 'Nombre',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: subjectController,
              decoration: const InputDecoration(
                icon: Icon(Icons.subject_rounded),
                hintText: 'Asunto',
                labelText: 'Asunto',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(
                icon: Icon(Icons.message),
                hintText: 'Mensaje',
                labelText: 'Mensaje',
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton(
                onPressed: () {
                  sendemail();
                  messageController.clear();
                  subjectController.clear();
                  nameController.clear();
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        )),
      ),
    );
  }
}
