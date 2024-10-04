import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back), // Icono de menu
          title: Text('Opiniones sobre tea connection salads...'),
        ),
        body: ListView(
          children: [
            Container(
              height: 72.0,
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(width: 30), //puntuacion 4.2
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('4.2'),
                    ),
                  ),
                  const SizedBox(width: 16.0), //estrellas y valoraciones
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('puntajes y valoraciones'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0), //separacion
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.white,
              child: const Text('Comentarios'),
            ),
            Container(
              height: 32.0,
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(width: 30), //boton todos
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('Todos'),
                    ),
                  ),
                  const SizedBox(width: 16.0), //boton 2
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('Positivos'),
                    ),
                  ),
                  const SizedBox(width: 16.0), //boton 3
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('Negativos'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0), //separacion
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Mariane'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text(
                  'No estoy exagerndo los conté. El poke viene con 1 pedacito de mango y 3 de edamame.'),
            ),
            Container(
              height: 80.0,
              color: Colors.transparent,
              child: Row(
                children: [
                  const SizedBox(width: 90), //boton todos
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('foto poke salmon bowl'),
                    ),
                  ),
                  const SizedBox(width: 90.0), //boton 2
                  Container(
                    child: Container(
                      color: Colors.orange,
                      child: const Text('foto otro plato'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Rodrigo'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('De nuevo no envian servicios.'),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Tamara'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Se veian mas apetitosos en la imagen.'),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Isabel'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Muy buenas las limonadas.'),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Rodrigo'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('De nuevo no envian servicios.'),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Tamara'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Se veian mas apetitosos en la imagen.'),
            ),
            const SizedBox(height: 12.0),
            Container(
              height: 66.0,
              width: double.infinity,
              color: Colors.blue,
              child: const Text('Isabel'),
            ),
            Container(
              height: 60.0,
              width: double.infinity,
              color: Colors.green,
              child: const Text('Muy buenas las limonadas.'),
            ),
          ],
        ),
      ),
    );
  }
}
