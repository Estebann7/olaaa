import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Senaleticas extends StatefulWidget {
  const Senaleticas({super.key});

  @override
  State<Senaleticas> createState() => _SenaleticasState();
}

class _SenaleticasState extends State<Senaleticas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Senaleticas'),
        backgroundColor: Colors.blueAccent,),
      body: Column(
        children: [
          Text(
          " NCh2111. Of1999: Protección contra incendios Señales de seguridad: Establece la señalización de seguridad en relación con el campo de protección y combate de incendio. Se encuentra el icono de señalización más común utilizada para indicar medios de alarma, vías de escape, equipos de lucha contra incendios, entre otros\nLas señaléticas en los establecimientos son de suma importancia, nos ayudan en momentos críticos de emergencias, y situaciones las cuales ponen en riesgo y en peligro la salud de todos los ocupantes del lugar es por esto que todo establecimiento debe contar con un sistema de señalizaciones en buenas condiciones, para que, en caso de cualquier imprevisto no planeado, todo el personal sepa a donde dirigirse a través de este sistema de señalización, como lo sita el siguiente artículo. "
        ),
        Image.asset(
            'images/2.jpg', // Reemplaza con la ruta de tu imagen
            width: 250,
            height: 250,
          ),
        ]
        
      ),
    );
  }
}