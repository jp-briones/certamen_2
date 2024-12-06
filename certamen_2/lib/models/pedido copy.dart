// // ignore_for_file: file_names, avoid_print

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Pedido {
//   final String id;
//   final DateTime fecha;
//   final String producto;
//   final double cantidad;
//   final String estado;
//   final bool bomba;
//   final bool muestra;
//   bool expanded;
//   final List<Map<String, dynamic>> guias;

//   Pedido({
//     required this.id,
//     required this.fecha,
//     required this.producto,
//     required this.cantidad,
//     required this.estado,
//     required this.bomba,
//     required this.muestra,
//     this.expanded = false,
//     required this.guias,
//   });

// ignore_for_file: file_names

//   factory Pedido.fromMap(String id, Map<String, dynamic> data) {
//     print('Data recibido para guias: ${data['guias']}');
//     return Pedido(
//       id: id,
//       fecha: (data['fecha'] as Timestamp).toDate(),
//       producto: data['producto'] ?? '',
//       cantidad: (data['cantidad'] as num).toDouble(),
//       estado: data['estado'] ?? '',
//       bomba: data['bomba'] ?? false,
//       muestra: data['muestra'] ?? false,
//       guias: (data['guias'] as List<dynamic>? ?? [])
//           .map((e) => Map<String, dynamic>.from(e as Map))
//           .toList(),
//     );
//   }
// }
