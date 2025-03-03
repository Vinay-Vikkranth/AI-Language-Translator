import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_language_translator_app/Controller/Translate_controller.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Widget/Custom_btn.dart';
import 'package:flutter_language_translator_app/Widget/Language_sheet.dart';
import 'package:get/get.dart';

class TranslatorFeature extends StatefulWidget {
  const TranslatorFeature({super.key});

  @override
  State<TranslatorFeature> createState() => _TranslatorFeatureState();
}

class _TranslatorFeatureState extends State<TranslatorFeature> {
  final _c = TranslateController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(title: const Text('Multi Language Translator')),

      //body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          top: mq.height * .02,
          bottom: mq.height * .1,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // from Language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.from,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child:
                      Obx(() => Text(_c.from.isEmpty ? 'Auto' : _c.from.value)),
                ),
              ),

              // swipe Language btn
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.repeat,
                  color: Colors.grey,
                ),
              ),

              // to Language
              InkWell(
                onTap: () => Get.bottomSheet(LanguageSheet(
                  c: _c,
                  s: _c.to,
                )),
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Container(
                  height: 50,
                  width: mq.width * .4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Obx(() => Text(_c.to.isEmpty ? 'To' : _c.to.value)),
                ),
              ),
            ],
          ),

          //text field
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mq.width * .04, vertical: mq.height * .035),
            child: TextFormField(
              controller: _c.textC,
              minLines: 2,
              maxLines: null,
              onTapOutside: (e) => FocusScope.of(context).unfocus(),
              decoration: const InputDecoration(
                  hintText: 'Translate anything you want',
                  hintStyle: TextStyle(fontSize: 13.5),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
            ),
          ),

          //result field
          if (_c.resultC.text.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .04),
              child: TextFormField(
                controller: _c.resultC,
                maxLines: null,
                onTapOutside: (e) => FocusScope.of(context).unfocus(),
                decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 13.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),

          //for adding some space

          if (_c.resultC.text.isNotEmpty)
            SizedBox(
              height: mq.height * .04,
            ),

          //translate btn
          CustomBtn(onTap: () {}, text: 'Translate')
        ],
      ),
    );
  }
}
