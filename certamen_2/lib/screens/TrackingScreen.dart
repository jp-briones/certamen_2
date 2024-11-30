import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Seguimiento'),
      body: ListView.builder(
        itemCount: 5, // Example item count
        itemBuilder: (context, index) {
          int pedidoNumber = index + 1;
          List<Map<String, String>> pedidosData = [
            {
              'fecha': '20-12-2024',
              'producto': 'Hormigón Tipo A',
              'volumen': '10 m³',
              'estado': 'En tránsito'
            },
            {
              'fecha': '22-12-2024',
              'producto': 'Hormigón Tipo B',
              'volumen': '15 m³',
              'estado': 'En preparación'
            },
            {
              'fecha': '24-12-2024',
              'producto': 'Hormigón Tipo C',
              'volumen': '8 m³',
              'estado': 'Entregado'
            },
            {
              'fecha': '26-12-2024',
              'producto': 'Hormigón Tipo D',
              'volumen': '20 m³',
              'estado': 'En espera'
            },
            {
              'fecha': '28-12-2024',
              'producto': 'Hormigón Tipo E',
              'volumen': '12 m³',
              'estado': 'En tránsito'
            },
          ];
          return ExpansionTile(
            title: Text('Pedido #$pedidoNumber'),
            subtitle:
                Text('Fecha de despacho: ' + pedidosData[index]['fecha']!),
            leading: const Icon(Icons.local_shipping, color: Colors.blue),
            trailing: const Icon(Icons.arrow_drop_down),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Detalle del pedido:'),
                    const SizedBox(height: 8.0),
                    Text('Producto: ' + pedidosData[index]['producto']!),
                    Text('Volumen: ' + pedidosData[index]['volumen']!),
                    Text('Estado: ' + pedidosData[index]['estado']!),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
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
