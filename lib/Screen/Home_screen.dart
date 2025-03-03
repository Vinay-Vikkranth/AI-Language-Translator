//this page provides the 3 cards from which we can select what to do
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_language_translator_app/Helper/global.dart";
import "package:flutter_language_translator_app/Model/Home_type.dart";
import "package:flutter_language_translator_app/Widget/Home_card.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Pref.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    //Initializing device size
    mq = MediaQuery.sizeOf(context);

    //Sample API call
    // APIs.getAnswer('what is your name?');

    return Scaffold(
        //app bar
        appBar: AppBar(
          elevation: 1,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text(
            appName,
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            // padding: const EdgeInsets.only(right: 10),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.brightness_4_rounded,
                    color: Colors.blue,
                    size: 26,
                  )),
            )
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(
              horizontal: mq.width * .04, vertical: mq.height * .015),
          children: HomeType.values
              .map((e) => HomeCard(
                    homeType: e,
                  ))
              .toList(),
        ));
  }
}
