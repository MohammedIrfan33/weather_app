import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAllData{

  String ? temprature;
  String ? maxTemprature;
  String ? condition;
  String ? windSpeed;
  String ? humidity;
  List<dynamic>  weeklydata =[];


  Future<void> getData() async{
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=e1a6934b847f4394aea165056220107&q=London&days=8&aqi=no&alerts=no'));
    dynamic  alldata = await jsonDecode(response.body);

    dynamic currentWeatherAllData = alldata["current"];



    temprature = currentWeatherAllData["temp_c"].toString();
    maxTemprature = alldata["forecast"]["forecastday"][0]["day"]["maxtemp_c"].toString();
    condition =  currentWeatherAllData["condition"]["text"];
    windSpeed  = currentWeatherAllData["wind_kph"].toString();
    humidity =  currentWeatherAllData["humidity"].toString();

    weeklydata = alldata["forecast"]["forecastday"];
    print(weeklydata.length);


  }

}