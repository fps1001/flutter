import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{ // Puede notificar cuando hay cambios.

  final ScrollController chatScrollController = ScrollController(); // se crea para poder hacer scroll abajo para cada mensaje.
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();


  List<Message> messageList = [
    Message (text: 'Hola Amor!', fromwho: FromWho.mine),
    Message (text: 'Ya regresaste?', fromwho: FromWho.mine)
  ];


  Future<void> sendMessage(String text) async { // Se llamará al pulsar intro o pulsar la flecha

    if (text.isEmpty){
      return;
    }

    final newMessage = Message(text: text, fromwho: FromWho.mine);
    messageList.add(newMessage);

    if(text.endsWith('?')){
      herReply();
    }
    
    notifyListeners(); // Es como el setState, indica a los que estén escuchando que ha habido un cambio!
    moveScrollToBottom();
  }


  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();

    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }


  Future <void> moveScrollToBottom() async{

    await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent, // este sería el offset que sería el final.
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut
    );
  }
}