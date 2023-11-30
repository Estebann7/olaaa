import 'package:flutter/material.dart';
import 'package:punto_central/src/pages/Registrarse.dart';
import 'package:punto_central/src/pages/home_page.dart';
import 'package:punto_central/src/pages/menu_principal.dart';
import 'package:punto_central/src/pages/registro_establecimiento.dart';
import 'package:punto_central/src/pages/soporte_cliente.dart';
import 'package:punto_central/src/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:punto_central/src/view/luces.dart';
import 'package:punto_central/src/view/senaleticas.dart';
import 'package:punto_central/src/view/usarapp.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //home: HomePage(),
      initialRoute: 'Home',
      routes: <String, WidgetBuilder>{
        'Home': (BuildContext context) => HomePage(),
        'MenuP': (BuildContext context) => MenuPrincipal(),
        'Registrarse': (BuildContext context) => Registrarse(),
        'MainScreen': (BuildContext context) => MainScreen(),
        'RegistroEstablecimiento': (BuildContext context) => RegistroEstablecimiento(),
        'SoporteCliente': (BuildContext context) => SoporteCliente(),
        'Senaletica': (BuildContext context) => Senaleticas(),
        'Luces': (BuildContext context) => Luces(),
        'UsarApp': (BuildContext context) => UsarApp(),

      },
    );
  }
}
