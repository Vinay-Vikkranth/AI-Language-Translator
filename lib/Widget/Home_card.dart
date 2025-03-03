import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_language_translator_app/Helper/global.dart';
import 'package:flutter_language_translator_app/Model/Home_type.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeCard extends StatelessWidget {
  final HomeType homeType;

  const HomeCard({super.key, required this.homeType});

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;
    return InkWell(
      onTap: homeType.onTap,
      child: Card(
        color: Colors.blue.withOpacity(.2),
        elevation: 0,
        margin: EdgeInsets.only(bottom: mq.height * 0.02),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: homeType.leftAlign
            ? Row(
                children: [
                  //Lottie
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/Lottie/${homeType.lottie}',
                    ),
                  ),

                  const Spacer(),

                  //Title
                  Text(
                    homeType.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5),
                  ),

                  const Spacer(flex: 2),
                ],
              )
            : Row(
                children: [
                  const Spacer(),

                  //Title
                  Text(
                    homeType.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: .5),
                  ),

                  const Spacer(),

                  //Lottie
                  Container(
                    width: mq.width * .35,
                    padding: homeType.padding,
                    child: Lottie.asset(
                      'assets/Lottie/${homeType.lottie}',
                    ),
                  ),
                ],
              ),
      ).animate().fade(duration: 1.seconds, curve: Curves.easeIn),
    );
  }
}
