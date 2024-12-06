// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

// A custom bottom navigation bar widget that allows for easy reuse across different screens.
class BottomNavBar extends StatelessWidget {
  // Callback function triggered when a bottom navigation item is tapped.
  final Function(int) onItemTapped;
  // Index of the currently selected item, used to highlight the active tab.
  final int currentIndex;

  // Constructor for BottomNavBar, requires a callback function and the current index.
  const BottomNavBar({
    required this.onItemTapped,
    required this.currentIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // Indicates which item is currently selected.
      currentIndex: currentIndex > 0 ? currentIndex - 1 : 0,
      // Defines the type of bottom navigation bar; 'fixed' keeps all items visible.
      type: BottomNavigationBarType.fixed,
      // Sets the background color of the bottom navigation bar to match the app theme.
      backgroundColor: Theme.of(context).primaryColor,
      // Sets the color for the selected item.
      selectedItemColor: currentIndex == 0 ? Colors.white70 : Colors.white,
      // Sets the color for items that are not selected.
      unselectedItemColor: Colors.white70,
      // Size of the icons in the bottom navigation bar.
      iconSize: 30.0,
      // List of items in the bottom navigation bar.
      items: const [
        BottomNavigationBarItem(
          // Icon for the 'Pedidos' tab, indicating orders.
          icon: Icon(Icons.local_shipping, color: Colors.white),
          // Label for the 'Pedidos' tab.
          label: 'Pedidos',
        ),
        BottomNavigationBarItem(
          // Icon for the 'Seguimiento' tab, indicating tracking.
          icon: Icon(Icons.track_changes, color: Colors.white),
          // Label for the 'Seguimiento' tab.
          label: 'Seguimiento',
        ),
        BottomNavigationBarItem(
          // Icon for the 'Documentos' tab, indicating documents.
          icon: Icon(Icons.insert_drive_file, color: Colors.white),
          // Label for the 'Documentos' tab.
          label: 'Documentos',
        ),
        BottomNavigationBarItem(
          // Icon for the 'Configuración' tab, indicating settings.
          icon: Icon(Icons.settings, color: Colors.white),
          // Label for the 'Configuración' tab.
          label: 'Configuración',
        ),
      ],
      // Callback function that is executed when an item is tapped.
      onTap: onItemTapped,
    );
  }
}
