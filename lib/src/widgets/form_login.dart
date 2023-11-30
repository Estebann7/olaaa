import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formularioestado = GlobalKey<FormState>();
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();

  validarDatos() async {
    // ignore: curly_braces_in_flow_control_structures
    try {
      // ignore: unused_local_variable
      int xcontra = 0;
      int xcorreo = 0;
      CollectionReference ref = FirebaseFirestore.instance.collection('Users');
      QuerySnapshot usuario = await ref.get();

      if (usuario.docs.length != 0  ) {
        for (var cursor in usuario.docs) {
          if (cursor.get('Correo') == correo.text) {
            print('Usuario encontrado');
            xcorreo = 1;
            if (cursor.get("Contraseña") == pass.text) {
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, "MainScreen");
            }else if(cursor.get('Correo') == correo.text && cursor.get("Contraseña") != pass.text){
                xcontra = 1;
            }
          }else{
            }
        }
      } else {
        print('No hay documentos en la colección');
      }
        if (xcontra == 1) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('PUNTO CENTRAL'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('La contraseña es incorrecta'),
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
                pass.clear();
              }else if(xcontra == 0){
              }
      if (xcorreo == 0) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('PUNTO CENTRAL'),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [
                      Text('El correo no existe. Te recomendamos verificarlo, o crearte una cuenta'),
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
        correo.clear();
        }
        else if(xcorreo == 0){
      }
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
                    controller: correo,
                    validator: (value) {
                      if (!value!.contains("@")) {
                        return "Ingrese un correo válido";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Correo electrónico",
                        border: InputBorder.none),
                  )),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: TextFormField(
                    controller: pass,
                    validator: (value) {
                      if (value!.length < 8) {
                        return "Ingrese una contraseña válida";
                      }

                      return null;
                    },
                    decoration: const InputDecoration(
                        hintText: "Contraseña", border: InputBorder.none),
                  )),
              Divider(height: 25,color: Colors.transparent),
              SizedBox(
                width: 400.0,
                height: 30.0,
                child: ElevatedButton(
                    onPressed: () {
                      validarDatos();
                    },
                    child: Text(
                      'Iniciar sesión',
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
