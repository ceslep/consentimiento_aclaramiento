// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final idController = TextEditingController(text: !kDebugMode ? '' : '');
  final nameController = TextEditingController(text: !kDebugMode ? '' : '');
  final ciudadController = TextEditingController(text: !kDebugMode ? '' : '');
  final representadoController =
      TextEditingController(text: !kDebugMode ? '' : '');

  @override
  void onClose() {
    idController.dispose();
    nameController.dispose();
    ciudadController.dispose();
    representadoController.dispose();
    super.onClose();
  }

  void submitForm() {
    if (Get.isSnackbarOpen) {
      Get.back();
    }
    // Validar el formulario y mostrar un mensaje
    if (idController.text.isNotEmpty && nameController.text.isNotEmpty) {
      print('ID: ${idController.text}, Nombres: ${nameController.text}');
      Get.snackbar('Formulario', 'Formulario enviado correctamente');
    } else {
      Get.snackbar('Error', 'Por favor completa todos los campos');
    }
  }
}
