import 'package:flutter/material.dart';
// import 'package:flutter_language_translator_app/Screen/Feature/Chatbot_feature.dart';
import 'package:flutter_language_translator_app/Screen/Feature/Chatbot_feature.dart';

import 'package:flutter_language_translator_app/Screen/Feature/Image_feature.dart';
import 'package:flutter_language_translator_app/Screen/Feature/Translator_feature.dart';
// import 'package:flutter_language_translator_app/Screen/Feature/Translator_feature.dart';

import 'package:get/get.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  //title
  String get title => switch (this) {
        HomeType.aiChatBot => 'Ai ChatBot',
        HomeType.aiImage => 'AI Image Creator',
        HomeType.aiTranslator => 'Language Translator',
      };

  //lottie
  String get lottie => switch (this) {
        HomeType.aiChatBot => 'Robot.json',
        HomeType.aiImage => 'Robot Playing.json',
        HomeType.aiTranslator => 'loading.json',
      };

  //title
  bool get leftAlign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };

  //for padding
  EdgeInsets get padding => switch (this) {
        HomeType.aiChatBot => EdgeInsets.zero,
        HomeType.aiImage => EdgeInsets.all(20),
        HomeType.aiTranslator => EdgeInsets.zero,
      };

  //for Navigation
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.to(() => const ChatbotFeature()),
        HomeType.aiImage => () => Get.to(() => const ImageFeature()),
        HomeType.aiTranslator => () => Get.to(() => const TranslatorFeature()),
      };
}
