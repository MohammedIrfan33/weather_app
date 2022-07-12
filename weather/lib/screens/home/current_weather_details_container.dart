import 'package:flutter/material.dart';
import 'package:weather/components/weather_stack.dart';
import 'package:weather/servieces/current_weather.dart';
import 'package:weather/utilities/constants.dart';

import 'dart:io';
import 'dart:convert';

class CurrentWeatherDetailsContainer extends StatelessWidget {
  const CurrentWeatherDetailsContainer({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherAllData weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.height/4 ,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withOpacity(.5),
            offset: const Offset(0, 25),
            spreadRadius: -12,
            blurRadius: 10,
          )
        ],
      ),
      child: WeatherStack(
        temprature: weatherData.temprature,
        condition: weatherData.condition,
        conditionIcon: weatherData.getCurrentWaetherICon(),
      ),
    );
  }
}
