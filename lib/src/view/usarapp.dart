import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UsarApp extends StatefulWidget {
  const UsarApp({super.key});

  @override
  State<UsarApp> createState() => _UsarAppState();
}

class _UsarAppState extends State<UsarApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('¿Como usar Punto Central?'),
        backgroundColor: Colors.blueAccent,),
      body: Column(
        children: [
          Text(
          'Cómo Usar Punto Central: Guía Rápida\n'
          '1. Crear una Cuenta:\n'
          'Para comenzar a utilizar Punto Central, primero necesitas crear una cuenta. Sigue estos pasos:\n'
          'Abre la aplicación Punto Central en tu dispositivo.\n'
          'Selecciona la opción "Crea tu cuenta aquí" en la pantalla principal.\n'
          'Completa la información requerida, incluyendo tu nombre de usuario, correo electrónico, contraseña y edad.\n'
          'Asegúrate de seguir las indicaciones para verificar tu cuenta.\n'
          '2. Iniciar Sesión:\n'

          'Una vez que hayas creado tu cuenta, inicia sesión para acceder a todas las funciones de la aplicación:\n'

          'Ingresa a la pantalla de inicio de sesión\n'
          'Ingresa tu correo y contraseña.\n'
          'Haz clic en "Iniciar Sesión" para acceder a tu cuenta.\n'
          '3. Escanear Código QR:\n'

          'Punto Central te permite escanear códigos QR para acceder a información de seguridad detallada. Sigue estos pasos:\n'

          'Desde la pantalla principal, elige la opción "Escanear QR".\n'
          'Apunta la cámara de tu dispositivo hacia el código QR.\n'
          'La aplicación detectará automáticamente el código y mostrará la información de seguridad asociada.\n'
          '4. Llamar a Servicios de Emergencia:\n'

          'En situaciones de emergencia, puedes utilizar la función de llamada de emergencia integrada:\n'

          'Ve al menú lateral en la esquina superior derecha\n'
          'Selecciona "Llamar a un servicio de emergencias"\n'
          'Selecciona el tipo de emergencia (Carabineros, bomberos, ambulancia).\n'
          'La aplicación redirigirá al  apartado de llamadas para realizar una llamada de emergencia.\n'
          '5. Solicitud de QR para Establecimientos:\n'

          'Si eres propietario de un establecimiento y deseas implementar códigos QR de seguridad:\n'

          'Ve al menú lateral en la esquina superior derecha\n'
          'Selecciona "Solicitar registro de establecimiento"\n'
          'Completa la información requerida y envía la solicitud.\n'
          'Obtendrás información sobre el estado de tu solicitud al correo proporcionado.\n'
          '6. Información y Conceptos Básicos:\n'

          'Encuentra información valiosa sobre seguridad y conceptos básicos:\n'

          'Ve al menú lateral en la esquina superior derecha\n'
          'Explora los diferentes articulos con información valiosa referente a las medidas de prevención de riesgos.\n'

          '¡Listo! Ahora puedes aprovechar al máximo las funciones de Punto Central para garantizar tu seguridad en cualquier espacio. \n'
          'Recuerda mantener tu información de inicio de sesión de forma segura y usar la información proporcionada para fines positivos.\n'
        ),
        
        ]
        
      ),
    );
  }
}