import 'package:flutter/material.dart';
import 'package:punto_central/src/screens/main_screen.dart';

void main() => runApp(const MenuPrincipal());

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, brightness: Brightness.dark),
      home: const MainScreen(),

    );
  }
}