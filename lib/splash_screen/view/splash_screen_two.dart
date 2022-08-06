import 'package:fundr_using_provider/splash_screen/view/login_splash.dart';
import 'package:lottie/lottie.dart';

import 'package:flutter/material.dart';

class ScreenSplashTwo extends StatelessWidget {
  const ScreenSplashTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String commonUserName = '';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        children: [
          // Lottie.asset(
          //   "lib/assets/money_getstarted.json",
          //   height: 500,
          // ),
          Expanded(
            flex: 1,
            child: Center(
              child: SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return const LoginScreen();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4b50c7),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
      backgroundColor: const Color.fromARGB(255, 237, 238, 255),
    );
  }
}
