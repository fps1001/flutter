import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mockup_mobility/blocs/blocs.dart';

class WMSDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<WMSBloc, WMSState>(
        builder: (context, state) {
          if (state is LayersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoaded) {
            return ListView.builder(
              itemCount: state.layers.length,
              itemBuilder: (context, index) {
                final layer = state.layers[index];
                return ListTile(
                  title: Text(layer),
                  selected: state.selectedLayer == layer,
                  onTap: () {
                    BlocProvider.of<WMSBloc>(context).add(SelectLayer(layer));
                    Navigator.of(context).pop();  // Cierra el drawer
                  },
                );
              },
            );
          } else if (state is LayersError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Sin capas disponibles'));
          }
        },
      ),
    );
  }
}
