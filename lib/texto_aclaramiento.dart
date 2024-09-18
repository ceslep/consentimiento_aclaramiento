import 'package:consentimiento_aclaramiento/datos_paciente.dart';
import 'package:consentimiento_aclaramiento/form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsentimientoScreen extends StatefulWidget {
  const ConsentimientoScreen({super.key});

  @override
  State<ConsentimientoScreen> createState() => _ConsentimientoScreenState();
}

class _ConsentimientoScreenState extends State<ConsentimientoScreen> {
  final formController = Get.put(FormController());
  late String nombre;

  @override
  void initState() {
    super.initState();
    nombre = formController.nameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () async {
                await Get.to(() => const DatosPaciente());
                setState(() {
                  nombre = formController.nameController.text;
                  print(nombre);
                });
              },
              icon: const Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save),
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
              'Yo $nombre identificado(a) con documento de identidad ________________ '
              'domiciliado(a) en la Ciudad de Cartago y actuando en nombre propio o como representante legal de '
              '______________________________________ acepto que:',
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
              'Existen tratamientos caseros como alternativa al aclaramiento dental en consultorio.',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'He comprendido las explicaciones que se me han facilitado en un lenguaje claro y sencillo...',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'PACIENTE: ______________________  ODONTOLOGO: ______________________',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
