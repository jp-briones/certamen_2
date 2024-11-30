// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:certamen_2/screens/home.dart';
import 'package:certamen_2/screens/register.dart';
import 'package:certamen_2/screens/splashscreen.dart';
import 'package:certamen_2/screens/sign.dart'; // Ruta correcta para el archivo sign.dart
import 'package:certamen_2/screens/authuser.dart'; // Ruta correcta para el archivo authuser.dart
import 'package:certamen_2/theme/theme.dart';

import 'package:certamen_2/screens/OrdersScreen.dart';
import 'package:certamen_2/screens/DocumentsScreen.dart';
import 'package:certamen_2/screens/UserScreen.dart';
import 'package:certamen_2/screens/SettingsScreen.dart';
import 'package:certamen_2/screens/TrackingScreen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const SplashScreen(), // Ruta para el splash screen
        '/home': (context) =>
            const HomeScreen(), // Ruta para la pantalla principal
        // '/sign': (context) =>
        //     const SignInPage(), // Ruta para la pantalla de inicio de sesión
        // '/register': (context) =>
        //     const RegisterPage(), // Ruta para la pantalla de inicio de sesión
        // '/authuser': (context) => const AuthUser(), // Ruta para AuthUser
        '/user': (context) => const UserScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/tracking': (context) => const TrackingScreen(),

        '/documents': (context) => const DocumentsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
