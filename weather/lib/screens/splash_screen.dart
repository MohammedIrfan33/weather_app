import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather/screens/welcome_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Image(
        image: AssetImage('assets/images/weather.png'),
      ),
      splashIconSize: 150,
      splashTransition: SplashTransition.fadeTransition,
      nextScreen: WelcomeScreen(),
      duration: 2000,

    );
  }
}
