import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:punto_central/src/utils/validaciones.dart';

class FormSoporteCliente extends StatefulWidget {
  const FormSoporteCliente({Key? key}) : super(key: key);

  @override
  State<FormSoporteCliente> createState() => _FormSoporteClienteState();
}

class _FormSoporteClienteState extends State<FormSoporteCliente> {
  final GlobalKey<FormState> _formularioestado = GlobalKey<FormState>();
  TextEditingController usuario = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController edad = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  bool obscurePassword =
      true; 

  registroUsuario() async {
    try {
      if (_formularioestado.currentState!.validate()) {
        // Validar campos antes de enviar los datos
        await firebase.collection('Users').doc().set({
          'Nombre': usuario.text,
          'Correo': correo.text,
          'Contraseña': pass.text,
          'Edad': edad.text,
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('PUNTO CENTRAL'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text('Cuenta creada exitosamente'),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pushNamed(context, "Home");
                  },
                )
              ],
            );
          },
        );
        pass.clear();
        usuario.clear();
        correo.clear();
        edad.clear();
      } else {
        print('Error: Verifica los campos');
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
                  controller: usuario,
                  validator: validarNombre,
                  decoration: const InputDecoration(
                      labelText: "Nombre usuario",
                      hintText: "Nombre",
                      border: InputBorder.none),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextFormField(
                controller: pass,
                validator: validarContrasena,
                obscureText:
                    obscurePassword, // Usa el valor de la variable para ocultar o mostrar la contraseña
                decoration: InputDecoration(
                  labelText: "Contraseña usuario",
                  hintText: "Contraseña",
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword =
                            !obscurePassword; // Cambia la visibilidad de la contraseña
                      });
                    },
                    child: Icon(
                      obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: correo,
                  validator: validarCorreo,
                  decoration: const InputDecoration(
                      labelText: "Correo Usuario",
                      hintText: "Correo electrónico",
                      border: InputBorder.none),
                )),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: TextFormField(
                  controller: edad,
                  validator: validarEdad,
                  decoration: const InputDecoration(
                      hintText: "Edad", border: InputBorder.none),
                )),
            Divider(height: 10, color: Colors.transparent),
            SizedBox(
              width: 400.0,
              height: 30.0,
              child: ElevatedButton(
                onPressed: () {
                  registroUsuario();
                },
                child: Text(
                  'Enviar',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'LTCushion',
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}