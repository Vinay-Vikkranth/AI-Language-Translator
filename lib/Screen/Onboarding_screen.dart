//This is the once pop up page which shows what all you can do with this app
import 'package:flutter/material.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Model/Onboard.dart';
import 'package:flutter_language_translator_app/Screen/Home_screen.dart';
import 'package:flutter_language_translator_app/Widget/Custom_btn.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      //Onboarding 1
      Onboard(
          title: 'Ask Me Anything',
          subtitle:
              'I can be your Best Friend & You can ask me anything & I will help you',
          lottie: 'World Languages'),

      //Onboarding 2
      Onboard(
          title: 'Imagination to Reality',
          subtitle: 'Just imagine anything & let me know',
          lottie: 'Robot Playing'),
    ];

    return Scaffold(
        body: PageView.builder(
            controller: c,
            itemCount: list.length,
            itemBuilder: (ctx, ind) {
              final isLast = ind == list.length - 1;

              return Column(
                children: [
                  //lottie
                  Lottie.asset('assets/Lottie/${list[ind].lottie}.json',
                      height: mq.height * .6,
                      width: isLast ? mq.width * .7 : null),

                  //title
                  Text(
                    list[ind].title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        letterSpacing: .5),
                  ),

                  //for adding some space
                  SizedBox(height: mq.height * 0.015),

                  //subtitle
                  SizedBox(
                    width: mq.width * .7,
                    child: Text(
                      list[ind].subtitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 13.5,
                          letterSpacing: .5,
                          color: Colors.black54),
                    ),
                  ),

                  //Dots
                  Wrap(
                    spacing: 10,
                    children: List.generate(
                        list.length,
                        (i) => Container(
                              width: i == ind ? 15 : 10,
                              height: 8,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                            )),
                  ),

                  const Spacer(),

                  //Button
                  CustomBtn(
                    onTap: () {
                      if (isLast) {
                        Get.off(() => const HomeScreen());
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //         builder: (_) => const HomeScreen()));
                      } else {
                        c.nextPage(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.ease);
                      }
                    },
                    text: isLast ? "Finish" : "Next",
                  ),

                  const Spacer(),
                ],
              );
            }));
  }
}
