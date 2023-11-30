import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:punto_central/src/utils/llamadas_emergencia.dart';

// ignore: constant_identifier_names
const MAPBOX_ACCESS_TOKEN =
    'pk.eyJ1IjoicGl0bWFjIiwiYSI6ImNsY3BpeWxuczJhOTEzbnBlaW5vcnNwNzMifQ.ncTzM4bW-jpq-hUFutnR1g';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? myPosition;

  Future<Position> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('error');
      }
    }
    return await Geolocator.getCurrentPosition();
  }

  void getCurrentLocation() async {
    Position position = await determinePosition();
    setState(() {
      myPosition = LatLng(position.latitude, position.longitude);
      print(myPosition);
    });
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("xyz"),
              accountEmail: Text("xyz@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("xyz"),
              ),
            ),
            ListTile(
              title: new Text("Llamar a un servicio de emergencias"),
              leading: new Icon(Icons.call),
              onTap: () => MostrarOpciones(context),
            ),
            ListTile(
              title: new Text("Solicitar registro de establecimiento"),
              leading: new Icon(Icons.add_home_work_rounded),
              onTap: () {
                 Navigator.pushNamed(context, "RegistroEstablecimiento");
              },
            ),
            ListTile(
              title: new Text("Soporte al cliente"),
              leading: new Icon(Icons.support_agent),
              onTap: () {
                 Navigator.pushNamed(context, "SoporteCliente");
              },
            ),
            Divider(
              height: 0.1,
            ),
            ListTile(
              title: new Text("¿Como usar Punto Central?"),
              leading: new Icon(Icons.auto_stories_rounded),
              onTap: () {
                 Navigator.pushNamed(context, "UsarApp");
              },
              
            ),
            ListTile(
              title: new Text("Luces de emergencia"),
              leading: new Icon(Icons.fire_extinguisher_rounded),
              onTap: () {
                 Navigator.pushNamed(context, "Luces");
              },
              
            ),
            ListTile(
              title: new Text("Senaleticas"),
              leading: new Icon(Icons.fire_extinguisher_rounded),
              onTap: () {
                 Navigator.pushNamed(context, "Senaletica");
              },
            ),
            ListTile(
              title: new Text("Relleno"),
              leading: new Icon(Icons.fire_extinguisher_rounded),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mapa'),
        backgroundColor: Colors.blueAccent,
      ),
      body: myPosition == null
          ? const CircularProgressIndicator()
          : FlutterMap(
              options: MapOptions(
                  center: myPosition, minZoom: 5, maxZoom: 25, zoom: 18),
              nonRotatedChildren: [
                TileLayer(
                  urlTemplate:
                      'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}',
                  additionalOptions: const {
                    'accessToken': MAPBOX_ACCESS_TOKEN,
                    'id': 'mapbox/streets-v12'
                  },
                ),
                MarkerLayer(
                markers:[
                  Marker(
                    point: myPosition!,
                    width: 80,
                    height: 80,
                    child: const Icon(
                            Icons.person_pin,
                            color: Colors.blueAccent,
                            size: 40,
                            
                          ),
                  ),
                ],
              ),
              MarkerLayer(
                markers:[
                  Marker(
                    point: LatLng(-37.077981, -72.437205),
                    width: 80,
                    height: 80,
                    child: const Icon(
                            Icons.person_pin,
                            color: Colors.blueAccent,
                            size: 40,
                            
                          ),
                  ),
                ],
              ),
              MarkerLayer(
                markers:[
                  Marker(
                    point: LatLng(-37.077734, -72.437860),
                    width: 80,
                    height: 80,
                    child: const Icon(
                            Icons.person_pin,
                            color: Colors.blueAccent,
                            size: 40,
                            
                          ),
                  ),
                ],
              ),
              MarkerLayer(
                markers:[
                  Marker(
                    point: LatLng(-37.077981, -72.437205),
                    width: 80,
                    height: 80,
                    child: const Icon(
                            Icons.person_pin,
                            color: Colors.blueAccent,
                            size: 40,
                            
                          ),
                  ),
                ],
              ),
              ],
              children: [],
            ),
            
    );
  }
}
