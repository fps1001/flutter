import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Importación WMS a OSM',
      home: Scaffold(
        body: WMSMap(),
      ),
    );
  }
}

class WMSMap extends StatelessWidget {
  const WMSMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: const MapOptions(
          initialCenter:
              LatLng(40.95821, -5.67413), // Parque Elio Antonio Nebrija
          initialZoom: 17.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          ),
          TileLayer(
            wmsOptions: WMSTileLayerOptions(
              baseUrl:
                  'https://ide.aytosalamanca.es/geoserver/ide_salamanca_life/wms',
              layers: const ['zonaslife_rdp_v4_sep21_25830'],
              format: 'image/png',
              transparent: true,
              //version: '1.3.0',
              otherParameters: const {
                'service': 'WMS',
                'request': 'GetMap',
                'styles': 'ide_salamanca_life:zonaslife',
                'crs': 'EPSG:25830', // Replace with the correct CRS if needed
                //'crs': 'EPSG:3857',
              },
            ),
          ),
        ],
      ),
    );
  }
}
