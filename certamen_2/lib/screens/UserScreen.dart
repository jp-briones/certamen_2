// ignore_for_file: file_names

import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuario'),
      ),
      body: const Center(
        child: Text('Pantalla de Usuario'),
      ),
    );
  }
}
