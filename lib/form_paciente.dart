// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Aquí puedes manejar el envío del formulario
      print('ID: ${_idController.text}, Nombres: ${_nameController.text}');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario enviado')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Identificación'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa la identificación';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Nombres'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa los nombres';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: const Text('Asignar'),
            ),
          ],
        ),
      ),
    );
  }
}
