import 'package:flutter_language_translator_app/Widget/Custom_loading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyDialog {
  //info
  static void info(String msg) {
    Get.snackbar('info', msg,
        backgroundColor: Colors.blue.withOpacity(.7), colorText: Colors.white);
  }

  //success
  static void success(String msg) {
    Get.snackbar('info', msg,
        backgroundColor: Colors.green.withOpacity(.7), colorText: Colors.white);
  }

  //error
  static void error(String msg) {
    Get.snackbar('info', msg,
        backgroundColor: Colors.red.withOpacity(.7), colorText: Colors.white);
  }

  //loading dialog
  static void showLoadingDialog() {
    Get.dialog(const Center(
      child: CustomLoading(),
    ));
  }
}
