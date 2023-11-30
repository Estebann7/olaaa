import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:webview_flutter/webview_flutter.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  String qrValue = "Codigo Qr";

  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  void scanQr() async {
    var status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      String? cameraScanResult = await scanner.scan();

      if (cameraScanResult != null) {
        setState(() {
          qrValue = cameraScanResult;
        });

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WebViewScreen(url: qrValue),
          ),
        );
      }
    } else {
      print("Permiso de cámara denegado");
    }
  }

  void showInstructions() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Instrucciones para escanear QR'),
          content: Text(
            '1. Abre la aplicación de escaneo QR.\n'
            '2. Apunta la cámara hacia el código QR.\n'
            '3. Asegúrate de que el código esté bien enfocado.\n'
            '4. El escaneo se realizará automáticamente.'
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Escanea un código QR para abrir la información de seguridad',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Image.asset(
            'images/scan_qr.png', 
            width: 250,
            height: 250,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: scanQr,
            child: Text('Escanear QR'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: showInstructions,
            child: Text('Instrucciones'),
            style: ElevatedButton.styleFrom(
              primary: Colors.grey,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Información de Seguridad'),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
