// ignore_for_file: file_names, library_private_types_in_public_api, unnecessary_cast

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:certamen_2/models/pedido.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';
import 'package:certamen_2/components/new_order_modal.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  List<Pedido> orders = [];

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    fetchPedidos();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> fetchPedidos() async {
    final pedidosCollection = FirebaseFirestore.instance.collection('pedidos');
    try {
      final snapshot = await pedidosCollection.get();
      setState(() {
        orders = snapshot.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return Pedido.fromMap(doc.id, data);
        }).toList();
      });
    } catch (e) {
      debugPrint('Error al obtener los pedidos: $e');
    }
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
                  _buildOrdersList(
                      filter: (pedido) => pedido.estado != 'Entregado'),
                  // Tab for 'Finalizados'
                  _buildOrdersList(
                      filter: (pedido) => pedido.estado == 'Entregado'),
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

  Widget _buildOrdersList({bool Function(Pedido)? filter}) {
    final filteredOrders =
        filter != null ? orders.where(filter).toList() : orders;

    if (filteredOrders.isEmpty) {
      return const Center(child: Text('No hay pedidos disponibles.'));
    }
    return ListView.builder(
      itemCount: filteredOrders.length,
      itemBuilder: (context, index) {
        final pedido = filteredOrders[index];
        return Card(
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                title: Text(
                  'Nota de Venta: ${pedido.id}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Fecha de Despacho: ${pedido.fecha.toLocal().toString().split(' ')[0]}'),
                    Text('Producto: ${pedido.producto}'),
                    Text('Cantidad: ${pedido.cantidad} m³'),
                    Text('Estado: ${pedido.estado}'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(
                      pedido.expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      pedido.expanded = !pedido.expanded;
                    });
                  },
                ),
              ),
              if (pedido.expanded)
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text(
                      //     'Fecha de Despacho: ${pedido.fecha.toLocal().toString().split(' ')[0]}'),
                      Text(
                          'Hora de Despacho: ${TimeOfDay.fromDateTime(pedido.fecha.toLocal()).format(context)}'),

                      // Text('Producto: ${pedido.producto}'),
                      // Text('Cantidad: ${pedido.cantidad} m³'),
                      // Text('Estado: ${pedido.estado}'),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Detalles del Pedido',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Bomba: ${pedido.bomba ? 'Sí' : 'No'}'),
                      Text('Muestra: ${pedido.muestra ? 'Sí' : 'No'}'),
                      Text('Dirección: ${pedido.direccion ?? 'No disponible'}'),
                      Text(
                          'Observaciones: ${pedido.observaciones ?? 'No disponible'}'),
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
