// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';

class Pedido {
  final String id;
  final DateTime fecha;
  final String producto;
  final double cantidad;
  final String estado;
  final bool bomba;
  final bool muestra;
  final String? direccion;
  final String? observaciones;
  bool expanded;
  final List<Map<String, dynamic>> guias;

  Pedido({
    required this.id,
    required this.fecha,
    required this.producto,
    required this.cantidad,
    required this.estado,
    required this.bomba,
    required this.muestra,
    this.direccion,
    this.observaciones,
    this.expanded = false,
    required this.guias,
  });

  factory Pedido.fromMap(String id, Map<String, dynamic> data) {
    final detalles = data['detalles'] as Map<String, dynamic>?;
    final guias = (data['guias'] as List<dynamic>? ?? [])
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();

    return Pedido(
      id: id,
      fecha: (data['fecha'] as Timestamp).toDate(),
      producto: data['producto'] ?? '',
      cantidad: (data['cantidad'] as num).toDouble(),
      estado: data['estado'] ?? '',
      bomba: data['bomba'] ?? false,
      muestra: data['muestra'] ?? false,
      direccion: detalles?['direccion'] as String?,
      observaciones: detalles?['observaciones'] as String?,
      guias: guias,
    );
  }
}
