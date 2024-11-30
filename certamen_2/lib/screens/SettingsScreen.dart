import 'package:flutter/material.dart';
import 'package:certamen_2/components/bottom_navbar_component.dart';
import 'package:certamen_2/components/appbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracion'),
      ),
      body: const Center(
        child: Text(
            'Pantalla de configuracion. Esta en proceso. Esta app la diseñe yo cuando estaba haciendo la practica en Cementos Bio Bio. Tuve que quitarle algunas pantallas (como el mapa interactivo) porque flutter a veces es muy mañoso con los problemas.'),
      ),
    );
  }
}
