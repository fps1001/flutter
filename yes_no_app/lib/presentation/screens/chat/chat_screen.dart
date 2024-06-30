import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://www.hola.com/horizon/landscape/fbce077c2ccb-anadearmas-portada-t.jpg?im=Resize=(640),type=downsize'),
          ),
        ),
        title: const Text('Mi amor ❤️'),
      centerTitle: false,),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
              itemCount: 101,
              itemBuilder: (context,index) {
              return (index % 2 == 0) ? 
              const HerMessageBubble():
              const MyMessageBubble();
              },
              )
            ),
            ///Caja de texto de mensajes
            const MessageFieldBox(),
          ],
        ),
      ),
    );
  }
}