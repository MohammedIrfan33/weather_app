import 'package:flutter/material.dart';
import 'package:weather/components/card_items.dart';
import 'package:weather/servieces/current_weather.dart';


class CurrentWeatherSubContainer extends StatelessWidget {
  const CurrentWeatherSubContainer({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherAllData weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: 40.0, vertical: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CardItems(
            text: 'Wind Speed',
            image: 'assets/images/windspeed.png',
            textResult: '${weatherData.windSpeed??'loading...'} km/h',
            isWeekResult: false,
          ),
          CardItems(
            text: 'Humidity',
            image: 'assets/images/humidity.png',
            textResult: weatherData.humidity ?? 'loading..',
            isWeekResult: false,
          ),
          CardItems(
            text: 'max Temp',
            image: 'assets/images/max-temp.png',
            textResult: weatherData.maxTemprature??'loading...',
            isWeekResult: false,
          ),
        ],
      ),
    );
  }
}

