import 'package:punto_central/src/view/mapa_view.dart';
import 'package:punto_central/src/view/qr_view.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final screens = [const MapaView(), const QrView()];

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            activeIcon: const Icon(Icons.map_outlined),
            label: 'Mapa',
            backgroundColor: colors.primary,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.qr_code),
            activeIcon: const Icon(Icons.qr_code_outlined),
            label: 'Escanear QR',
            backgroundColor: colors.tertiary,
          ),
        ],
      ),
    );
  }
}
