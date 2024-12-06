// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:certamen_2/screens/home.dart';
import 'package:certamen_2/screens/register.dart';
import 'package:certamen_2/screens/splashscreen.dart';
import 'package:certamen_2/screens/sign.dart';
import 'package:certamen_2/screens/authuser.dart';
import 'package:certamen_2/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:certamen_2/theme/theme_provider.dart';
import 'package:certamen_2/screens/OrdersScreen.dart';
import 'package:certamen_2/screens/DocumentsScreen.dart';
import 'package:certamen_2/screens/UserScreen.dart';
import 'package:certamen_2/screens/SettingsScreen.dart';
import 'package:certamen_2/screens/TrackingScreen.dart';
import 'firebase_options.dart';
import 'package:certamen_2/screens/profile_screen.dart';
import 'package:certamen_2/screens/miau.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/sign': (context) => const SignInPage(),
        '/register': (context) => const RegisterPage(),
        '/authuser': (context) => const AuthUser(),
        '/user': (context) => const UserScreen(),
        '/orders': (context) => const OrdersScreen(),
        '/tracking': (context) => const TrackingScreen(),
        '/documents': (context) => const DocumentsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/miau': (context) => const MiauScreen(),
      },
    );
  }
}
