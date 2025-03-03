import 'package:flutter/material.dart';
// import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Model/message.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MessageCard extends StatelessWidget {
  final Message message;

  const MessageCard({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mq = MediaQuery.of(context); // Obtain MediaQueryData
    const r = Radius.circular(15);

    return message.msgType == MessageType.bot
        ?

        // For Bot
        Row(
            children: [
              const SizedBox(width: 6),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Image.asset('assets/Images/TextRobot.png', width: 24),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: mq.size.width * 0.6),
                margin: EdgeInsets.only(
                    bottom: mq.size.height * .02, left: mq.size.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.size.height * 0.01,
                    horizontal: mq.size.width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.only(
                      topLeft: r, topRight: r, bottomRight: r),
                ),
                child: message.msg.isEmpty
                    ? AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            ' Please Wait... ',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        repeatForever: true,
                      )
                    : Text(
                        message.msg,
                        textAlign: TextAlign.center,
                      ),
              ),
            ],
          )
        :

        // For User
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: mq.size.width * 0.6),
                margin: EdgeInsets.only(
                    bottom: mq.size.height * .02, right: mq.size.width * 0.02),
                padding: EdgeInsets.symmetric(
                    vertical: mq.size.height * 0.01,
                    horizontal: mq.size.width * 0.02),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius:
                      BorderRadius.only(topLeft: r, topRight: r, bottomLeft: r),
                ),
                child: Text(
                  message.msg,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: 6), // Removed 'const'
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ],
          );
  }
}
