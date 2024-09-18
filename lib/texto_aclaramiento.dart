import 'package:consentimiento_aclaramiento/datos_paciente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConsentimientoScreen extends StatelessWidget {
  const ConsentimientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Get.to(const DatosPaciente());
                /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DatosPaciente()),
                ); */
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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CONSENTIMIENTO INFORMADO ACLARAMIENTO EN CONSULTORIO ODONTOLÓGICO',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Yo___________________________________ identificado(a) con documento de identidad ________________ '
              'domiciliado(a) en la Ciudad de Cartago y actuando en nombre propio o como representante legal de '
              '______________________________________ acepto que:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'El aclaramiento dental está diseñado para aclarar el color de sus dientes usando una mezcla de Peróxido '
              'de Hidrógeno. Este produce un máximo aclaramiento en el menor tiempo con la mínima sensibilidad. Durante '
              'el procedimiento, el gel aclarador será aplicado en sus dientes en 3 a 4 sesiones de 20 minutos cada una.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Riesgos:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Sensibilidad dental: Algunos pacientes experimentan sensibilidad dental, lo cual es normal.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Irritación de la encía y/o tejidos: Puede causar irritación de la encía, labios o comisuras labiales.',
              style: TextStyle(fontSize: 16.0),
            ),
            Text(
              '- Restauraciones existentes: Obturaciones, coronas o carillas no aclararán de forma pareja con sus dientes naturales.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Expectativas:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Un aclaramiento dental significativo puede ser logrado, pero no se puede predecir exactamente cuán blancos '
              'quedarán los dientes. Algunas manchas no cambiarán significativamente.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Importante:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'El tratamiento no está recomendado para mujeres embarazadas, lactantes, menores de 14 años, o personas alérgicas '
              'al Peróxido de Hidrógeno.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tratamientos Alternativos:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Existen tratamientos caseros como alternativa al aclaramiento dental en consultorio.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'He comprendido las explicaciones que se me han facilitado en un lenguaje claro y sencillo...',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'PACIENTE: ______________________  ODONTOLOGO: ______________________',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
