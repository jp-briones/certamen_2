// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';

class MiauScreen extends StatelessWidget {
  const MiauScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'En Construcción'),
      bottomNavigationBar: BottomNavBar(
        currentIndex: -1, // No resaltamos ninguna opción específica
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/images/miau.png',
                    height: 250.0,
                    width: 250.0,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Esta página está en construcción.',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '(Puede que nunca termine de estar en construcción).',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
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
        Navigator.pushNamed(context, '/settings');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
