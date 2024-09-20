// ignore_for_file: avoid_print

import 'package:consentimiento_aclaramiento/api.dart';
import 'package:consentimiento_aclaramiento/configuracion.dart';
import 'package:consentimiento_aclaramiento/data_consentimiento_model.dart';
import 'package:consentimiento_aclaramiento/datos_paciente.dart';
import 'package:consentimiento_aclaramiento/form_controller.dart';
import 'package:consentimiento_aclaramiento/signature.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ConsentimientoScreen extends StatefulWidget {
  const ConsentimientoScreen({super.key});

  @override
  State<ConsentimientoScreen> createState() => _ConsentimientoScreenState();
}

class _ConsentimientoScreenState extends State<ConsentimientoScreen> {
  bool generando = false;
  final formController = Get.put(FormController());
  late String nombre;
  late String identificacion;
  late String ciudad;
  late String representado;
  String firma = "";

  @override
  void initState() {
    super.initState();
    nombre = formController.nameController.text;
    identificacion = formController.idController.text;
    ciudad = formController.ciudadController.text;
    representado = formController.representadoController.text;
    firma = "";
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDay = DateFormat('d').format(now); // Día del mes
    String formattedMonth =
        DateFormat('MMMM', 'es').format(now); // Mes en español
    String formattedYear = DateFormat('y').format(now); // Año
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                await Get.to(() => const Configuracion());
              },
              icon: const Icon(Icons.settings),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                firma = await Get.to(() => const Signature());
                print(firma);
              },
              icon: const Icon(Icons.document_scanner_sharp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                await Get.to(() => const DatosPaciente());
                setState(() {
                  nombre = formController.nameController.text;
                  identificacion = formController.idController.text;
                  ciudad = formController.ciudadController.text;
                  representado = formController.representadoController.text;
                });
              },
              icon: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: !generando
                ? IconButton(
                    onPressed: () async {
                      if (firma.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Firma requerida',
                            ),
                          ),
                        );
                      } else {
                        AclaramientoModel aclaramiento = AclaramientoModel(
                          identificacion: identificacion,
                          nombre: nombre,
                          ciudad: ciudad,
                          representado: representado,
                          firma: firma,
                          dia: formattedDay,
                          mes: formattedMonth,
                          anio: formattedYear,
                        );
                        setState(() {
                          generando = true;
                        });
                        final result =
                            await generarConsentimiento(aclaramiento);
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(result),
                          ),
                        );
                        setState(() {
                          generando = false;
                        });
                        launchInBrowser(identificacion);
                      }
                    },
                    icon: const Icon(Icons.save),
                  )
                : const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                  ),
          ),
        ],
        title: const Text('Aclaramiento Dental'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'CONSENTIMIENTO INFORMADO ACLARAMIENTO EN CONSULTORIO ODONTOLÓGICO',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Yo $nombre identificado(a) con documento de identidad N° $identificacion '
              'domiciliado(a) en la Ciudad de $ciudad y actuando en nombre propio o como representante legal de '
              '$representado acepto que:',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'El aclaramiento dental está diseñado para aclarar el color de sus dientes usando una mezcla de Peróxido '
              'de Hidrógeno. Este produce un máximo aclaramiento en el menor tiempo con la mínima sensibilidad. Durante '
              'el procedimiento, el gel aclarador será aplicado en sus dientes en 3 a 4 sesiones de 20 minutos cada una.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Riesgos:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              '- Sensibilidad dental: Algunos pacientes experimentan sensibilidad dental, lo cual es normal.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Irritación de la encía y/o tejidos: Puede causar irritación de la encía, labios o comisuras labiales.',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              '- Restauraciones existentes: Obturaciones, coronas o carillas no aclararán de forma pareja con sus dientes naturales.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Expectativas:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Un aclaramiento dental significativo puede ser logrado, pero no se puede predecir exactamente cuán blancos '
              'quedarán los dientes. Algunas manchas no cambiarán significativamente.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Importante:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'El tratamiento no está recomendado para mujeres embarazadas, lactantes, menores de 14 años, o personas alérgicas '
              'al Peróxido de Hidrógeno.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Tratamientos Alternativos:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Existen tratamientos caseros como alternativa al aclaramiento dental en consultorio odontológico, , existen otras alternativas en el mercado disponibles para Uds, tales como Aclaramiento caseros.  ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'Yo entiendo que el Aclaramiento Dental en el consultorio odontológico no puede ser garantizado y que este depende de los cuidados que yo tenga después de finalizado tales como abstenerme de consumir cualquier sustancia cromo génica, por ejemplo: salsas, bebidas oscuras, carotenos durante las siguientes 72 horas. ',
              style: TextStyle(fontSize: 16.0),
            ),
            const Text(
              'He comprendido las explicaciones que se me han facilitado en un lenguaje claro y sencillo, y el odontólogo (a) que me ha atendido me ha permitido realizar todas las observaciones y me ha aclarado todas las dudas que le he planteado. También comprendo que, en cualquier momento y sin necesidad de dar ninguna explicación, puedo revocar el consentimiento que ahora presto. ',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Por ello, manifiesto que estoy satisfecho con la información recibida y que comprendo el alcance y los riesgos del tratamiento, y en tales condiciones se suscribe este consentimiento en Cartago a los $formattedDay días de $formattedMonth de $formattedYear. ',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
