// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Configuración'),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text(
                'Información del Perfil',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Nombre'),
                subtitle: const Text('Juan Pérez'),
              ),
              ListTile(
                leading: const Icon(Icons.business),
                title: const Text('Constructora'),
                subtitle: const Text('Constructora Los Andes S.A.'),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Correo Electrónico'),
                subtitle: const Text('juan.perez@losandes.com'),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text('Número de Teléfono'),
                subtitle: const Text('+56 9 8765 4321'),
              ),
              const SizedBox(height: 24.0),
              Card(
                elevation: 2.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'lib/assets/images/ejecutivo.jpg',
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Contacto del Ejecutivo Comercial',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            ListTile(
                              leading: const Icon(Icons.person_outline),
                              title: const Text('Nombre del Ejecutivo'),
                              subtitle: const Text('Carlos Gómez'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.email),
                              title: const Text('Correo Electrónico'),
                              subtitle: const Text('carlos.gomez@grupocbb.cl'),
                            ),
                            ListTile(
                              leading: const Icon(Icons.phone),
                              title: const Text('Número de Teléfono'),
                              subtitle: const Text('+56 9 1234 5678'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Text(
                'Configuración de Seguridad',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Cambiar Contraseña'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar Sesión'),
                onTap: () {},
              ),
            ],
          ),
        ),
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
        Navigator.pushNamed(context, '/settings');
        break;
      case 4:
        // Stay on the profile screen
        break;
    }
  }
}
