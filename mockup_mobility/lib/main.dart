import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/wms_map.dart';
import 'blocs/wms/wms_bloc.dart';
import 'services/wms_service.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => WMSBloc()),
    ],
    child: const MockupMobilityApp(),
  ));
}

class MockupMobilityApp extends StatelessWidget {
  const MockupMobilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    //final wmsService = WMSService('path/to/your/wms_capabilities.xml');

    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Prueba Importación WMS a OSM',
        home: const WMSMap());
  }
}
