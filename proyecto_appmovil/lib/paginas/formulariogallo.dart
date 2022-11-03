import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class formulariogallo extends StatelessWidget {
  const formulariogallo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Gallos'),
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
}
