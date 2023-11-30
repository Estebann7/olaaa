import 'package:flutter/material.dart';
import 'package:punto_central/src/widgets/form_registro.dart';
//import 'package:punto_central/src/widgets/icon_container.dart';

class Registrarse extends StatefulWidget {
  const Registrarse({super.key});

  @override
  State<Registrarse> createState() => _RegistrarseState();
}

class _RegistrarseState extends State<Registrarse> {
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
                  'Crear cuenta',
                  style: TextStyle(fontFamily: 'LTCushion', fontSize: 22.0),
                ),
                const Formregistro(),
                Divider(
                  height: 1.0,color: Colors.transparent
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60.0,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "Home");
                      },
                      child: Text(
                        'Iniciar sesion',
                        style: TextStyle(
                            color: Color.fromARGB(255, 253, 1, 1),
                            fontFamily: 'LTCushion',
                            fontSize: 20.0),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
