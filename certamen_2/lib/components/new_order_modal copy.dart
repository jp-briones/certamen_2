// // ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore

// import 'package:flutter/material.dart';

// class NewOrderModal extends StatefulWidget {
//   const NewOrderModal({Key? key}) : super(key: key);

//   @override
//   State<NewOrderModal> createState() => _NewOrderModalState();
// }

// class _NewOrderModalState extends State<NewOrderModal> {
//   bool _servicioBomba = false;
//   bool _muestraAdicional = false;

// ignore_for_file: file_names

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding:
//           const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16.0),
//       ),
//       child: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Nuevo Pedido',
//                 style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Dirección de Entrega',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Nota de Venta',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Fecha de Despacho',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: 'DD-MM-AAAA',
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Producto',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Hora de Entrega',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: '09:00',
//                         prefixIcon: Icon(Icons.access_time),
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16.0),
//                   Expanded(
//                     child: TextField(
//                       decoration: const InputDecoration(
//                         labelText: 'Volumen',
//                         floatingLabelBehavior: FloatingLabelBehavior.always,
//                         hintText: '5 m³',
//                         labelStyle: TextStyle(
//                             color: Colors.black87,
//                             fontSize: 16.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CheckboxListTile(
//                       contentPadding: EdgeInsets.zero,
//                       title: const Text('Servicio de Bomba'),
//                       value: _servicioBomba,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _servicioBomba = value ?? false;
//                         });
//                       },
//                       activeColor: Colors.blue,
//                     ),
//                   ),
//                   Expanded(
//                     child: CheckboxListTile(
//                       contentPadding: EdgeInsets.zero,
//                       title: const Text('Muestra Adicional'),
//                       value: _muestraAdicional,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           _muestraAdicional = value ?? false;
//                         });
//                       },
//                       activeColor: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16.0),
//               TextField(
//                 decoration: const InputDecoration(
//                   labelText: 'Observaciones',
//                   floatingLabelBehavior: FloatingLabelBehavior.always,
//                   hintText: 'Al llegar al portón, llamar a...',
//                   labelStyle: TextStyle(
//                       color: Colors.black87,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 24.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Cancelar'),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Handle order submission here
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('Agregar'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
