import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
