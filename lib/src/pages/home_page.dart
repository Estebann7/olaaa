import 'package:flutter/material.dart';
import 'package:punto_central/src/widgets/form_login.dart';

//import 'package:punto_central/src/widgets/icon_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  height: 15.0,color: Colors.transparent
                ),
                Text(
                  'Inicio de Sesión',
                  style: TextStyle(fontFamily: 'LTCushion', fontSize: 22.0),
                ),
                Divider(
                  height: 50.0,color: Colors.transparent
                ),
                const FormLogin(),
                Divider(
                  height: 1.0,color: Colors.transparent
                ),
                SizedBox(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "Registrarse");
                      },
                      child: Text(
                        'Crea tu cuenta aquí',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
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
