// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> generarConsentimiento(String json) async {
  Uri urlpdf = Uri.parse("generacons.php");
  var jsond = jsonDecode(json);
  String bodyData = jsonEncode(jsond);
  try {
    final response = await http.post(urlpdf, body: bodyData);
    if (response.statusCode == 200) {
      print("php=>${jsonDecode(response.body)}");
    } else {
      print(response.statusCode);
    }
  } catch (e) {
    print("error en f $e");
  }
}
