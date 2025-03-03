import 'package:flutter/material.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: const StadiumBorder(),
              elevation: 0,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              minimumSize: Size(mq.width * .4, 50)),
          onPressed: onTap,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
