import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class FormregistroEstablecimiento extends StatefulWidget {
  const FormregistroEstablecimiento({super.key});

  @override
  State<FormregistroEstablecimiento> createState() => _FormregistroEstablecimientoState();
}

class _FormregistroEstablecimientoState extends State<FormregistroEstablecimiento> {
  final GlobalKey<FormState> _formularioestado = GlobalKey<FormState>();
  TextEditingController usuario = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController correo = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  registroUsuario() async {
    try {
      await firebase.collection('Users').doc().set({
        'Nombre': usuario.text,
        'Correo': correo.text,
        'Contraseña': pass.text,
        //'Informacion': informacion.text
      });
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('PUNTO CENTRAL'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Solicitud enviada exitosamente'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    } catch (e) {
      print('ERROR...' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Form(
          key: _formularioestado,
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    controller: usuario,
                    validator: (value) {
                      if (value!.length < 3) {
                        return "Ingrese un nombre valido";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Nombre establecimiento",
                        hintText: "Nombre",
                        border: InputBorder.none),
                  )),
              
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    controller: correo,
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return "Ingrese un correo válido";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        labelText: "Correo contacto",
                        hintText: "Correo contacto",
                        border: InputBorder.none),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    
                    decoration: const InputDecoration(
                        labelText: "informacion",
                        hintText: "informacion",
                        border: InputBorder.none),
                  )),
              Divider(height: 10, color: Colors.transparent),
              SizedBox(
                width: 400.0,
                height: 30.0,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formularioestado.currentState!.validate()) {
                        print("todo bien");
                        Navigator.pushNamed(context, "MainScreen");
                      } else {
                        print("error");
                      }
                      registroUsuario();
                    },
                    child: Text(
                      'Enviar solicitud',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'LTCushion',
                          fontSize: 20.0),
                    )),
              ),
            ],
          )),
    );
  }
}