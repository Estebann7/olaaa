import 'package:flutter/material.dart';

import 'package:punto_central/src/widgets/form_registro_establecimiento.dart';
//import 'package:punto_central/src/widgets/icon_container.dart';

class RegistroEstablecimiento extends StatefulWidget {
  const RegistroEstablecimiento ({super.key});

  @override
  State<RegistroEstablecimiento > createState() => _RegistroEstablecimientoState();
}

class _RegistroEstablecimientoState extends State<RegistroEstablecimiento > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
          Color.fromARGB(0, 80, 162, 239),
          Color.fromARGB(255, 78, 199, 255)
        ], begin: Alignment.topCenter)),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('images/Logo-pc.png'),
                Divider(
                  height: 10.0,color: Colors.transparent
                ),
                Text(
                  'Solicitud registro\n de establecimiento',
                  style: TextStyle(fontFamily: 'LTCushion', fontSize: 22.0),
                ),
                const FormregistroEstablecimiento(),
                Divider(
                  height: 1.0,color: Colors.transparent
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}