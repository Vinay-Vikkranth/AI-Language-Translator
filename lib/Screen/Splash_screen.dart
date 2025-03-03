//this is the first page that we see with the logo of app
import "package:flutter/material.dart";
import "package:flutter_language_translator_app/Helper/global.dart";
import "package:flutter_language_translator_app/Screen/Onboarding_screen.dart";
import "package:flutter_language_translator_app/Widget/Custom_loading.dart";
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //wait for some time on splash and then move to next screen
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() =>
          // Goes to the OnBoarding_screen
          const OnboardingScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    //Initializing device size
    mq = MediaQuery.sizeOf(context);

    return Scaffold(
        body: SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          //Spacer is used for aligning
          const Spacer(
            flex: 2,
          ),

          //logo
          Card(
              // color: Colors.blue,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child:
                    Image.asset('assets/Images/logo.png', width: mq.width * .4),
              )),

          //Space
          Spacer(),

          //Lottie Animation
          CustomLoading(),

          //Space
          Spacer()
        ],
      ),
    ));
  }
}
