import 'package:flutter/material.dart';
import 'package:weather/screens/splash_screen.dart';
import 'package:weather/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
