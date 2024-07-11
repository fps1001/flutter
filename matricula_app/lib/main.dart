// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matricula_app/blocs/matricula/matricula_bloc.dart';
import 'package:matricula_app/blocs/matricula/matricula_event.dart';
import 'package:matricula_app/screens/matricula_home_page.dart';
import 'package:matricula_app/services/services.dart';

void main() {
  final dataManager = DataManager();
  final consultaService = ConsultaService(dataManager);

  runApp(
    BlocProvider(
      create: (context) => MatriculaBloc(dataManager, consultaService)
        ..add(MatriculaCargarDatosEvent()),
      child: const MatriculaApp(),
    ),
  );
}

class MatriculaApp extends StatelessWidget {
  const MatriculaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MatriculaHomePage(),
    );
  }
}
