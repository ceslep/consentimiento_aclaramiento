// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:consentimiento_aclaramiento/data_consentimiento_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart'; // Necesario para usar kDebugMode

Future<String> loadDatauRL() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getString('url') ?? '';
}

Future<String> generarConsentimiento(AclaramientoModel aclaramiento) async {
  late String url;
  if (!kDebugMode) {
    url = await loadDatauRL();
  } else {
    url = 'http://127.0.0.1';
  }
  Uri urlpdf =
      Uri.parse("$url/consentimientos/php/generacons_aclaramiento.php");

  String bodyData = jsonEncode(aclaramiento.toJson());
  try {
    final response = await http.post(urlpdf,
        headers: {
          'Content-Type':
              'application/json', // Cabecera para indicar que se está enviando JSON
        },
        body: bodyData);
    if (response.statusCode == 200) {
      return ("php=>${jsonDecode(response.body)}");
    } else {
      return (response.statusCode.toString());
    }
  } catch (e) {
    return ("error en f $e");
  }
}

Future<bool> launchInBrowser(String identificacion) async {
  late String urlss;
  bool result = false;
  if (!kDebugMode) {
    urlss = await loadDatauRL();
  } else {
    urlss = 'http://127.0.0.1';
  }
  Uri urlpdf = Uri.parse(
      "$urlss/consentimientos/php/consentimientos/consentimiento_aclaramiento_$identificacion.pdf");
  if (!await launchUrl(
    urlpdf,
    mode: LaunchMode.externalApplication,
  )) {
    result = false;
    throw Exception('Could not launch $urlpdf');
  } else {
    result = true;
  }
  return result;
}
