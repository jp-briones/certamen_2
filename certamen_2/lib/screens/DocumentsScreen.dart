import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({Key? key}) : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Documentos'),
      body: ListView.builder(
        itemCount: 10, // Updated item count
        itemBuilder: (context, index) {
          final int documentNumber = 306 + index;
          final DateTime startDate = DateTime(2024, 2, 6);
          final DateTime documentDate = startDate
              .add(Duration(days: index * 2 + (index % 2 == 0 ? 0 : 1)));
          final String formattedDate =
              "${documentDate.day.toString().padLeft(2, '0')}-${documentDate.month.toString().padLeft(2, '0')}-${documentDate.year}";

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              leading: const Icon(Icons.insert_drive_file, color: Colors.blue),
              title: Text('factura$documentNumber$formattedDate'),
              subtitle: Text('Fecha de emisión: $formattedDate'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DocumentImageScreen(),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 3,
        onItemTapped: (index) => _onItemTapped(context, index),
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
    }
  }
}

class DocumentImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalle del Documento')),
      body: Center(
        child: InteractiveViewer(
          child: Image.asset('lib/assets/images/cbb_documento.png'),
        ),
      ),
    );
  }
}
