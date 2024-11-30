import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:certamen_2/components/formulario.dart';

class DetalleProfesoresScreen extends StatelessWidget {
  final DocumentSnapshot usuario;

  const DetalleProfesoresScreen({super.key, required this.usuario});

  Future<void> _deleteUser(BuildContext context, String id) async {
    final confirm = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Eliminar usuario'),
          content:
              const Text('¿Estás seguro de que deseas eliminar este usuario?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );

    if (confirm == true) {
      try {
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(id)
            .delete();
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop(); // Regresar a la pantalla anterior
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuario eliminado exitosamente')),
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error al eliminar el usuario')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final usuarioData = usuario.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Profesor'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormularioScreen(usuario: usuario),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _deleteUser(context, usuario.id),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${usuarioData['nombre']} ${usuarioData['apellido_paterno']} ${usuarioData['apellido_materno']}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Teléfono: ${usuarioData['telefono']}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Text(
              'Fecha de nacimiento: ${usuarioData['fecha_nacimiento'] ?? 'No disponible'}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
