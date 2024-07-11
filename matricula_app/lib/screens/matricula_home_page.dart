// lib/screens/matricula_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matricula_app/blocs/matricula/matricula_bloc.dart';
import 'package:matricula_app/blocs/matricula/matricula_event.dart';
import 'package:matricula_app/blocs/matricula/matricula_state.dart';
import 'package:matricula_app/widgets/sliding_up_panel.dart';

class MatriculaHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  MatriculaHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta Matrícula'),
      ),
      body: BlocConsumer<MatriculaBloc, MatriculaState>(
        listener: (context, state) {
          if (state is MatriculaError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SlidingUpPanelWidget(
            etiqueta: state is MatriculaLoaded ? state.etiqueta : '',
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Matrícula',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      final matricula = _controller.text;
                      context
                          .read<MatriculaBloc>()
                          .add(MatriculaBuscarEvent(matricula));
                    },
                    child: const Text('Buscar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
