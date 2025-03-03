import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_language_translator_app/Controller/Image_controller.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Widget/Custom_btn.dart';
import 'package:flutter_language_translator_app/Widget/Custom_loading.dart';
import 'package:lottie/lottie.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ImageFeature extends StatefulWidget {
  const ImageFeature({super.key});

  @override
  State<ImageFeature> createState() => _ImageFeatureState();
}

class _ImageFeatureState extends State<ImageFeature> {
  final _c = ImageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with AI Assistant'),

        //share btn
        actions: [
          Obx(() => _c.status.value == Status.complete
              ? IconButton(
                  onPressed: _c.shareImage, icon: const Icon(Icons.share))
              : const SizedBox())
        ],
      ),

      //download btn
      floatingActionButton: Obx(() => _c.status.value == Status.complete
          ? Padding(
              padding: const EdgeInsets.only(right: 6, bottom: 6),
              child: FloatingActionButton(
                onPressed: _c.downloadImage,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: const Icon(
                  Icons.save_alt_rounded,
                  size: 26,
                ),
              ))
          : const SizedBox()),

      //body
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            top: mq.height * .02,
            bottom: mq.height * .1,
            left: mq.width * .04,
            right: mq.width * .04),
        children: [
          //text field
          TextFormField(
            controller: _c.textC,
            textAlign: TextAlign.center,
            minLines: 2,
            maxLines: null,
            onTapOutside: (e) => FocusScope.of(context).unfocus(),
            decoration: const InputDecoration(
                hintText:
                    'Imagine something wonderful * innovative \n Type here & I will create it for you',
                hintStyle: TextStyle(fontSize: 13.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
          ),

          // Add space here
          SizedBox(height: mq.height * 0.02),

          //ai Image
          Container(
              height: mq.height * .5,
              alignment: Alignment.center,
              child: Obx(() => _aiImage())),

          // Add space here
          SizedBox(height: mq.height * 0.02),

          //Button
          CustomBtn(onTap: _c.createAIImage, text: 'Create')
        ],
      ),
    );
  }

  Widget _aiImage() => switch (_c.status.value) {
        Status.none => Lottie.asset('assets/Lottie/Robot Playing.json',
            height: mq.height * .3),
        Status.complete => ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: _c.url,
              placeholder: (context, url) => const CustomLoading(),
              errorWidget: (context, url, error) => const SizedBox(),
            ),
          ),
        Status.loading => const CustomLoading()
      };
}
