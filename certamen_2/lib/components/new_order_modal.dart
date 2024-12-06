// ignore_for_file: use_super_parameters, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewOrderModal extends StatefulWidget {
  const NewOrderModal({Key? key}) : super(key: key);

  @override
  State<NewOrderModal> createState() => _NewOrderModalState();
}

class _NewOrderModalState extends State<NewOrderModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _notaController = TextEditingController();
  final TextEditingController _fechaController = TextEditingController();
  final TextEditingController _productoController = TextEditingController();
  final TextEditingController _horaController = TextEditingController();
  final TextEditingController _volumenController = TextEditingController();
  final TextEditingController _observacionesController =
      TextEditingController();
  bool _servicioBomba = false;
  bool _muestraAdicional = false;

  @override
  void dispose() {
    _direccionController.dispose();
    _notaController.dispose();
    _fechaController.dispose();
    _productoController.dispose();
    _horaController.dispose();
    _volumenController.dispose();
    _observacionesController.dispose();
    super.dispose();
  }

  Future<void> _addOrderToFirestore() async {
    if (_formKey.currentState?.validate() ?? false) {
      final direccion = _direccionController.text;
      final nota = _notaController.text;
      final producto = _productoController.text;
      final volumen = double.tryParse(_volumenController.text) ?? 0.0;
      final observaciones = _observacionesController.text;

      // Convertir fecha y hora a DateTime
      final fechaParts = _fechaController.text.split('-');
      final horaParts = _horaController.text.split(':');
      DateTime fechaHora = DateTime(
        int.parse(fechaParts[2]),
        int.parse(fechaParts[1]),
        int.parse(fechaParts[0]),
        int.parse(horaParts[0]),
        int.parse(horaParts[1]),
      ).toLocal();

      final newOrder = {
        'nota': nota,
        'fecha': Timestamp.fromDate(fechaHora),
        'producto': producto,
        'cantidad': volumen,
        'estado': 'Por Confirmar',
        'bomba': _servicioBomba,
        'muestra': _muestraAdicional,
        'detalles': {
          'direccion': direccion,
          'fechaProgramacion': Timestamp.fromDate(fechaHora),
          'volumen': volumen,
          'bomba': _servicioBomba,
          'muestra': _muestraAdicional,
          'observaciones': observaciones,
          'guias': [
            {
              'numero': nota,
              'fecha': Timestamp.fromDate(fechaHora),
              'producto': producto,
              'cantidad': volumen,
            }
          ]
        }
      };

      try {
        await FirebaseFirestore.instance
            .collection('pedidos')
            .doc(nota)
            .set(newOrder);
        Navigator.of(context).pop();
      } catch (e) {
        debugPrint('Error al agregar el pedido: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nuevo Pedido',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _direccionController,
                        decoration: const InputDecoration(
                          labelText: 'Dirección de Entrega',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la dirección de entrega';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _notaController,
                        decoration: const InputDecoration(
                          labelText: 'Nota de Venta',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la nota de venta';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _fechaController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Fecha de Despacho',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: 'DD-MM-AAAA',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _fechaController.text =
                                  "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la fecha de despacho';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _productoController,
                        decoration: const InputDecoration(
                          labelText: 'Producto',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el producto';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _horaController,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'Hora de Entrega',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '09:00',
                          prefixIcon: Icon(Icons.access_time),
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _horaController.text =
                                  "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
                            });
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese la hora de entrega';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: TextFormField(
                        controller: _volumenController,
                        decoration: const InputDecoration(
                          labelText: 'Volumen',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          hintText: '5 m³',
                          labelStyle: TextStyle(
                              color: Colors.black87,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese el volumen';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Por favor ingrese un número válido';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Servicio de Bomba'),
                        value: _servicioBomba,
                        onChanged: (bool? value) {
                          setState(() {
                            _servicioBomba = value ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Muestra Adicional'),
                        value: _muestraAdicional,
                        onChanged: (bool? value) {
                          setState(() {
                            _muestraAdicional = value ?? false;
                          });
                        },
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _observacionesController,
                  decoration: const InputDecoration(
                    labelText: 'Observaciones',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: 'Al llegar al portón, llamar a...',
                    labelStyle: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: _addOrderToFirestore,
                      child: const Text('Agregar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
