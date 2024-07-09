import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../blocs/blocs.dart';


class WMSMap extends StatelessWidget {
  const WMSMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba Importación WMS a OSM'),
      ),
      drawer: const LayerDrawer(),
      body: BlocBuilder<WMSBloc, WMSState>(
        builder: (context, state) {
          if (state is LayersInitial) {
            context.read<WMSBloc>().add(LoadLayers());
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoaded) {
            return const Center(child: Text('Seleccione una capa del menú'));
          } else if (state is LayerSelected) {
            print("Selected layer: ${state.selectedLayer}");
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
                    layers: [state.selectedLayer],
                    format: 'image/png',
                    transparent: true,
                  ),
                ),
              ],
            );
          }else if (state is LayersError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}

class LayerDrawer extends StatelessWidget {
  const LayerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<WMSBloc, WMSState>(
        builder: (context, state) {
          if (state is LayersLoaded) {
            return ListView.builder(
              itemCount: state.layers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.layers[index]),
                  onTap: () {
                    context.read<WMSBloc>().add(SelectLayer(state.layers[index]));
                    Navigator.pop(context); // Cerrar el drawer al seleccionar una capa
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
