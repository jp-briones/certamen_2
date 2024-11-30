// ignore_for_file: unused_import

import 'package:certamen_2/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:certamen_2/screens/authuser.dart'; // Asegúrate de que esta ruta esté correcta

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    // Configura un retraso para la animación y el cambio de pantalla
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        opacity = 0.0; // Hacemos que el SplashScreen se desvanezca
      });

      // Después de un breve retraso, navega a AuthUser
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(
              // builder: (context) => const AuthUser()), // Navega a AuthUser
              builder: (context) => const HomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).colorScheme.primary, // Fondo con el color primario
      body: Center(
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: opacity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/cbb_logo.png', // Ajusta la ruta de la imagen
                width: 250,
                height: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                ' ',
                style: TextStyle(
                  fontFamily: 'AfacadFlux-Regular',
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
