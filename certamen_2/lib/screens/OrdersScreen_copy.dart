// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';
import 'package:certamen_2/components/new_order_modal.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  // Sample list representing orders
  List<Map<String, dynamic>> orders = [
    {
      'nota': '40548944',
      'fecha': '06-02-2024 9:30',
      'producto': 'G030(10)-20-12-28-B',
      'cantidad': '22.5 m³',
      'estado': 'Por Confirmar',
      'expanded': false,
      'detalles': {
        'fechaProgramacion': '21-07-2021',
        'volumen': '22.5 m³',
        'bomba': 'No',
        'muestra': 'No',
        'guias': [
          {
            'numero': '4054894',
            'fecha': '06-02-2024 9:30',
            'producto': 'G030(10)-20-12-28-B',
            'cantidad': '22.5 m³'
          },
          // Simon Bolivar 8864
          {
            'numero': '2852446',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
          {
            'numero': '2896658',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
        ]
      }
    },
    {
      'nota': '40548945',
      'fecha': '03-02-2024 14:00',
      'producto': 'G030(10)-20-12-28-B-HELI',
      'cantidad': '30 m³',
      'estado': 'Confirmado',
      'expanded': false,
      'detalles': {
        'fechaProgramacion': '21-07-2021',
        'volumen': '30 m³',
        'bomba': 'No',
        'muestra': 'No',
        'guias': [
          {
            'numero': '40548945',
            'fecha': '03-02-2024 14:00',
            'producto': 'G030(10)-20-12-28-B-HELI',
            'cantidad': '30 m³'
          },
          {
            'numero': '2852446',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
          {
            'numero': '2896658',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
        ]
      }
    },
    {
      'nota': '40548944',
      'fecha': '02-02-2024 14:00',
      'producto': 'G025(10)-20-12-28-B',
      'cantidad': '3 m³',
      'estado': 'Confirmado',
      'expanded': false,
      'detalles': {
        'fechaProgramacion': '21-07-2021',
        'volumen': '3 m³',
        'bomba': 'No',
        'muestra': 'No',
        'guias': [
          {
            'numero': '40548944',
            'fecha': '29-01-2024 13:15',
            'producto': 'G030(10)-20-12-28-B-HELI',
            'cantidad': '22 m³'
          },
          {
            'numero': '2852446',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
          {
            'numero': '2896658',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
        ]
      }
    },
    {
      'nota': 'c',
      'fecha': '12-01-2024 10:30',
      'producto': 'G030(10)-20-12-28-B',
      'cantidad': '50 m³',
      'estado': 'Anulado',
      'expanded': false,
      'detalles': {
        'fechaProgramacion': '21-07-2021',
        'volumen': '50 m³',
        'bomba': 'No',
        'muestra': 'No',
        'guias': [
          {
            'numero': '40548944',
            'fecha': '12-01-2024 10:30',
            'producto': 'G030(10)-20-12-28-B',
            'cantidad': '50 m³'
          },
          {
            'numero': '2852446',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
          {
            'numero': '2896658',
            'fecha': '24-08-2021 10:30',
            'producto': 'SG30(10)-10-16-28-B',
            'cantidad': '5 m³'
          },
        ]
      }
    },
  ];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Neohaus Las Condes'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar for 'Todos', 'En proceso', 'Finalizados'
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(text: 'Todos'),
                Tab(text: 'En proceso'),
                Tab(text: 'Finalizados'),
              ],
            ),
            const SizedBox(height: 16.0),
            // Display list of orders with detailed information
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Tab for 'Todos'
                  _buildOrdersList(),
                  // Tab for 'En proceso'
                  _buildOrdersList(),
                  // Tab for 'Finalizados'
                  _buildOrdersList(),
                ],
              ),
            ),
            // Button to add a new order
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const NewOrderModal();
                    },
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 12.0),
                  ),
                  child: const Text(
                    'Nuevo Pedido',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1, // Set the index for the 'Pedidos' tab
        onItemTapped: (index) => _onItemTapped(context, index),
      ),
    );
  }

  Widget _buildOrdersList() {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Nota de Venta: ${orders[index]['nota']}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fecha de Despacho: ${orders[index]['fecha']}'),
                    Text('Producto: ${orders[index]['producto']}'),
                    Text('Cantidad: ${orders[index]['cantidad']}'),
                    Text('Estado: ${orders[index]['estado']}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(orders[index]['expanded']
                      ? Icons.expand_less
                      : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      orders[index]['expanded'] = !orders[index]['expanded'];
                    });
                  },
                ),
              ),
              if (orders[index]['expanded'])
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Fecha de Programación: ${orders[index]['detalles']['fechaProgramacion']}'),
                      Text('Volumen: ${orders[index]['detalles']['volumen']}'),
                      Text('Bomba: ${orders[index]['detalles']['bomba']}'),
                      Text('Muestra: ${orders[index]['detalles']['muestra']}'),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Detalles del Pedido',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Número de Guía')),
                            DataColumn(label: Text('Fecha de Despacho')),
                            DataColumn(label: Text('Producto')),
                            DataColumn(label: Text('Cantidad')),
                          ],
                          rows: List<DataRow>.generate(
                            orders[index]['detalles']['guias'].length,
                            (i) => DataRow(
                              cells: [
                                DataCell(Text(orders[index]['detalles']['guias']
                                    [i]['numero'])),
                                DataCell(Text(orders[index]['detalles']['guias']
                                    [i]['fecha'])),
                                DataCell(Text(orders[index]['detalles']['guias']
                                    [i]['producto'])),
                                DataCell(Text(orders[index]['detalles']['guias']
                                    [i]['cantidad'])),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
