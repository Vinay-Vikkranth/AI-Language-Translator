import 'package:flutter/material.dart';
import 'package:flutter_language_translator_app/Controller/Chat_controller.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Widget/Message_card.dart';
import 'package:get/get.dart';

class ChatbotFeature extends StatefulWidget {
  const ChatbotFeature({super.key});

  @override
  State<ChatbotFeature> createState() => _ChatbotFeatureState();
}

class _ChatbotFeatureState extends State<ChatbotFeature> {
  final _c = ChatController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat with AI Assistant')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _c.textC,
                textAlign: TextAlign.center,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    isDense: true,
                    hintText: 'Ask me anything you want...',
                    hintStyle: TextStyle(fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              ),
            ),

            //for adding some space
            const SizedBox(width: 8),

            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: _c.askQuestion,
                icon: const Icon(Icons.rocket_launch_rounded,
                    color: Colors.white, size: 28),
              ),
            )
          ],
        ),
      ),
      body: Obx(
        () => ListView(
          physics: const BouncingScrollPhysics(),
          controller: _c.scrollC,
          padding:
              EdgeInsets.only(top: mq.height * .02, bottom: mq.height * .1),
          children: _c.list.map((e) => MessageCard(message: e)).toList(),
        ),
      ),
    );
  }
}
