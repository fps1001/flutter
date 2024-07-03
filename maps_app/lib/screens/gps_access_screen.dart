import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

//Se necesitan dos widget, uno para saber si la localización está activada y otra para el permiso.
class GpsAccessScreen extends StatelessWidget {
  const GpsAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(// Hay que determinar si hay que mostrar uno u otro.
            child: BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        //print('state: $state'); //Debug
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccessButton();
      },
    ))
        // child: _AccessButton(),
        //child: _EnableGpsMessage()
        );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
            color: Colors.black,
            onPressed: () {
              //TODO Por hacer
            },
            shape: const StadiumBorder(),
            elevation: 0,
            splashColor: Colors.transparent,
            child: const Text(
              'Solicitar acceso',
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Debe de habilitar el GPS',
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
