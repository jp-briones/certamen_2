// ignore_for_file: file_names, use_super_parameters, use_key_in_widget_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';
import 'package:provider/provider.dart';
import 'package:certamen_2/theme/theme_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool _darkMode = themeProvider.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: const CustomAppBar(title: 'Configuración'),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Perfil'),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SwitchListTile(
            title: const Text('Modo Oscuro'),
            value: _darkMode,
            onChanged: (bool value) {
              themeProvider
                  .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
            },
          ),
          SwitchListTile(
            title: const Text('Notificaciones'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacidad'),
            onTap: () {
              Navigator.pushNamed(context, '/miau');
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Idioma'),
            onTap: () {
              Navigator.pushNamed(context, '/miau');
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Ayuda y Soporte'),
            onTap: () {
              Navigator.pushNamed(context, '/miau');
            },
          ),
        ],
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/orders');
        break;
      case 1:
        Navigator.pushNamed(context, '/tracking');
        break;
      case 2:
        Navigator.pushNamed(context, '/documents');
        break;
      case 3:
        // Stay on the settings screen
        break;
    }
  }
}
