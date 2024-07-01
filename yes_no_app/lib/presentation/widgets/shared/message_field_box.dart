import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged <String> onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode =
        FocusNode(); // Para controlar el foco de la pantalla en un objeto.

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              textController.clear();
              onValue(textValue); // Se cambia por el print

            },
            icon: const Icon(Icons.send_outlined)) // Icono para enviar
        );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        onValue (value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
