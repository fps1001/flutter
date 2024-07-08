import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'screens/wms_map.dart';
import 'blocs/wms/wms_bloc.dart';
import 'services/wms_service.dart';

Future<void> main() async {
  // Carga las variables de entorno desde el archivo .env
  await dotenv.load(fileName: "config/wms_url.env");
  final wmsService = WMSService(dotenv.env['WMS_URL']!);

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => WMSBloc(wmsService)),
    ],
    child: const MockupMobilityApp(),
  ));
}

class MockupMobilityApp extends StatelessWidget {
  const MockupMobilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Importación WMS a OSM',
      home: WMSMap(),
    );
  }
}
