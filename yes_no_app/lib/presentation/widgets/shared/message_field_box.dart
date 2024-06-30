import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme; 

    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(20) ),
        filled: true,
        suffixIcon: IconButton(onPressed: (){}, icon: const Icon (Icons.send_outlined))// Icono para enviar
      )
    );
  }
}