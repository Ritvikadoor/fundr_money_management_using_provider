import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fundr_using_provider/home/view/screen_home.dart';
import 'package:fundr_using_provider/splash_screen/view/splash_screen_two.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () => callHome(context));
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: const Color.fromARGB(255, 237, 238, 255),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo_fundr.png',
              height: 150,
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Your Own Financial Journal',
                    textStyle: const TextStyle(
                      color: Color(0xff4b50c7),
                      fontSize: 20,
                    )),
                TyperAnimatedText(
                  'Fundr',
                  textStyle: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4b50c7),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  callHome(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    final data = pref.getBool('check') ?? false;
    if (data == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ScreenSplashTwo()));
    } else {
      var commonUserName = pref.getString('name') ?? 'User';
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ScreenHome()));
    }
  }
}
