import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:mockup_mobility/widgets/wms_drawer.dart';
import 'package:mockup_mobility/blocs/blocs.dart';

class WMSMap extends StatelessWidget {
  const WMSMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba Importación WMS a OSM'),
      ),
      drawer: WMSDrawer(),
      body: BlocBuilder<WMSBloc, WMSState>(
        builder: (context, state) {
          if (state is LayersInitial) {
            context.read<WMSBloc>().add(LoadLayers());
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoaded) {
            if (state.selectedLayer == null) {
              return const Center(child: Text('Selecciona una capa del menú.'));
            } else {
              return FlutterMap(
                options: const MapOptions(
                  initialCenter: LatLng(40.95821, -5.67413),
                  initialZoom: 14.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  ),
                  TileLayer(
                    wmsOptions: WMSTileLayerOptions(
                      baseUrl: 'https://ide.aytosalamanca.es/geoserver/ide_salamanca_life/wms?SERVICE=WMS&',
                      layers: [state.selectedLayer!], // Asegurarse de que no es nulo
                      format: 'image/png',
                      transparent: true,
                    ),
                  ),
                ],
              );
            }
          } else if (state is LayersError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Sin datos disponibles'));
          }
        },
      ),
    );
  }
}
