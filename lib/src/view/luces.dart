import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Luces extends StatefulWidget {
  const Luces({super.key});

  @override
  State<Luces> createState() => _LucesState();
}

class _LucesState extends State<Luces> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Luces de emergencia'),
        backgroundColor: Colors.blueAccent,),
      body: Column(
        children: [
          Text(
          "La Norma Chilena Número 4 (NCh4) indica que los sistemas de emergencia serán necesarios en recintos asistenciales, colegios, hoteles, teatros, recintos deportivos, locales de reunión de personas o cualquier lugar que cumpla con estas características",

        ),
        Image.asset(
            'images/Luces.jpg', // Reemplaza con la ruta de tu imagen
            width: 250,
            height: 250,
          ),
        ]
        
      ),
    );
  }
}