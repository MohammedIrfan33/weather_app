import 'package:flutter/material.dart';
import 'package:weather/components/reuseable_text.dart';
import 'package:weather/utilities/constants.dart';

class WeatherStack extends StatelessWidget {
  const WeatherStack(
      {this.temprature, this.condition, this.conditionIcon, Key? key})
      : super(key: key);

  final String? temprature;
  final String? condition;
  final String? conditionIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -30,
          left: 20,
          child: Image(
            image: AssetImage(conditionIcon ?? kDefault),
            width: 120,
          ),
        ),
        Positioned(
          right: 20.0,
          top: 25.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(text: temprature ?? '38', textSize: 60.0),
              ReusableText(text: '0', textSize: 30.0),
            ],
          ),
        ),
        Positioned(
          bottom: 30.0,
          left: 30.0,
          child: Text(
            condition ?? 'loading....',
            style: kWeatherStatusStyle,
          ),
        )
      ],
    );
  }
}
