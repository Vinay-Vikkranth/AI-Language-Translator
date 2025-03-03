import 'dart:io';
// import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Helper/my_dialog.dart';
import 'package:get/get.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:gallery_saver_updated/gallery_saver.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

enum Status { none, loading, complete }

class ImageController extends GetxController {
  final textC = TextEditingController();

  final status = Status.none.obs;

  String url = '';

  Future<void> createAIImage() async {
    if (textC.text.trim().isNotEmpty) {
      OpenAI.apiKey = apikey;
      status.value = Status.loading;

      OpenAIImageModel image = await OpenAI.instance.image.create(
          prompt: textC.text,
          n: 1,
          size: OpenAIImageSize.size512,
          responseFormat: OpenAIImageResponseFormat.url);

      url = image.data[0].url.toString();

      // textC.text = '';
      status.value = Status.complete;
    } else {
      MyDialog.info('Provide some beautiful image description!');
    }
  }

  void downloadImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');

      //to show loading
      MyDialog.showLoadingDialog();

      //save image to gallery
      await GallerySaver.saveImage(file.path, albumName: appName)
          .then((success) {
        //hide loading
        Get.back();

        MyDialog.success('Image Downloaded to Gallery');
      });
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something went wrong (Try again in Sometime)!');
      log('downloadImageE: $e');
    }
  }

  void shareImage() async {
    try {
      //To show loading
      MyDialog.showLoadingDialog();

      log('url: $url');

      final bytes = (await get(Uri.parse(url))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);

      log('filePath: ${file.path}');

      //hide loading
      Get.back();

      await Share.shareXFiles([XFile(file.path)],
          text: 'Check This AI Image by Vinay');
    } catch (e) {
      //hide loading
      Get.back();
      MyDialog.error('Something went wrong (Try again in Sometime)!');
      log('downloadImageE: $e');
    }
  }
}
