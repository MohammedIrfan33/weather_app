import 'package:flutter/material.dart';
import 'package:weather/screens/city_selected.dart';
import 'package:weather/utilities/constants.dart';

class WelcomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        height: size.height,
        width: size.width,
        color: kPrimaryColor.withOpacity(.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/get-started.png'),
            const SizedBox(height: 60,),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CitySelected()));
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: size.width*.25,vertical: 15.0),
                primary: kPrimaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.00),
                ),
              ),
              child: const Text(
                  'Get Started',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
