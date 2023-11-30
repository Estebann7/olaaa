// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';

void MostrarOpciones(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, const Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment(0.0, -1.0),
                end: Alignment.bottomCenter,
              ),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Servicios de emergencia",
                    style: TextStyle(color: Colors.white,fontSize: 20.0,
                    fontWeight: FontWeight.bold,)),
                SizedBox(height: 16.0),
                ListTile(
                  leading: Icon(Icons.local_fire_department),
                  title: Text("Bomberos"),
                  onTap: () => _realizarLlamadaConPermisos(context, "123"),
                ),
                ListTile(
                  leading: Icon(Icons.local_hospital),
                  title: Text("Ambulancia"),
                  onTap: () => _realizarLlamadaConPermisos(context, "1234"),
                ),
                ListTile(
                  leading: Icon(Icons.local_police),
                  title: Text("Carabineros"),
                  onTap: () => _realizarLlamadaConPermisos(context, "12345"),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}

void _realizarLlamadaConPermisos(
    BuildContext context, String phoneNumber) async {
  // Solicitar permisos
  var status = await Permission.phone.status;

  if (status == PermissionStatus.granted) {
    // Permiso concedido, realizar llamada
    _realizarLlamada(phoneNumber);
  } else {
    // El usuario no concedió permisos, solicitar permisos
    var result = await Permission.phone.request();

    if (result == PermissionStatus.granted) {
      // Permiso concedido después de la solicitud
      _realizarLlamada(phoneNumber);
    } else {
      // El usuario no concedió permisos después de la solicitud
      _mostrarDialogoPermisosDenegados(context);
    }
  }
}

void _realizarLlamada(String phoneNumber) async {
  final Uri phoneCallUri = Uri(scheme: 'tel', path: phoneNumber);
  if (await canLaunch(phoneCallUri.toString())) {
    await launch(phoneCallUri.toString());
  } else {
    print('Error al realizar la llamada');
  }
}

void _mostrarDialogoPermisosDenegados(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Permisos Denegados"),
        content: Text(
            "No se otorgaron los permisos necesarios para realizar la llamada."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Aceptar"),
          ),
        ],
      );
    },
  );
}