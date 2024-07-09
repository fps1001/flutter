import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockup_mobility/blocs/blocs.dart';

class WMSDrawer extends StatelessWidget {
  const WMSDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<WMSBloc, WMSState>(
        builder: (context, state) {
          if (state is LayersLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LayersLoaded) {
            return ListView(
              children: state.layers.keys.map((title) {
                return ListTile(
                  title: Text(title),
                  onTap: () {
                    context.read<WMSBloc>().add(SelectLayer(title));
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            );
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
