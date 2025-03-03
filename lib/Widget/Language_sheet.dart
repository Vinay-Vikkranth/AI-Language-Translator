import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_language_translator_app/Controller/Translate_controller.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:get/get.dart';

class LanguageSheet extends StatelessWidget {
  final TranslateController c;
  final RxString s;

  const LanguageSheet({super.key, required this.c, required this.s});

  @override
  Widget build(BuildContext context) {
    final search = ''.obs;

    return Container(
      height: mq.height * .5,
      padding: EdgeInsets.only(
          left: mq.width * .04, right: mq.width * .04, top: mq.height * .02),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Column(
        children: [
          TextFormField(
              onChanged: (s) => search.value = s.toLowerCase(),
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.translate_rounded, color: Colors.blue),
                  hintText: 'Search Language....',
                  hintStyle: TextStyle(fontSize: 14),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))))),
          Expanded(
            child: Obx(
              () {
                final List<String> list = search.isEmpty
                    ? c.lang
                    : c.lang
                        .where((e) => e.toLowerCase().contains(search.value))
                        .toList();
                return ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.only(top: mq.height * .02, left: 6),
                    itemBuilder: (ctx, i) {
                      return InkWell(
                        onTap: () {
                          s.value = list[i];
                          Get.back();
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: mq.height * .02),
                          child: Text(list[i]),
                        ),
                      );
                    });
              },
            ),
          )
        ],
      ),
    );
  }
}
