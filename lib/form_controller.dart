// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final idController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void onClose() {
    idController.dispose();
    nameController.dispose();
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
