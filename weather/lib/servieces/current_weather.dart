import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

import 'package:weather/utilities/constants.dart';

class WeatherAllData{


  String  ? location;
  String ? temprature;
  String ? maxTemprature;
  String ? condition;
  String ? weeklyCondition;
  String ? windSpeed;
  String ? humidity;
  int ? weatherConditionCode;
  int  currentConditionCode = 0;
  String ? currentDate;



  List<dynamic>  daysWeatherData =[];
  String ?days;
  String ? daysCondtion;
  String ? daysTempretur;
  String ? daysWindSpeed;
  String ? daysMaxTemp;
  String ? daysHumidity;
  dynamic convertedDaysDate;


  Future<void> getData(String ? location) async{
    final response = await http.get(Uri.parse('http://api.weatherapi.com/v1/forecast.json?key=e1a6934b847f4394aea165056220107&q=$location&days=6&aqi=no&alerts=no'));
    dynamic  alldata = await jsonDecode(response.body);

    dynamic currentWeatherAllData = alldata["current"];


    temprature = currentWeatherAllData["temp_c"].round().toString();
    maxTemprature = alldata["forecast"]["forecastday"][0]["day"]["maxtemp_c"].toString();
    condition =  currentWeatherAllData["condition"]["text"];
    windSpeed  = currentWeatherAllData["wind_kph"].toString();
    humidity =  currentWeatherAllData["humidity"].toString();

    daysWeatherData = alldata["forecast"]["forecastday"];
    currentConditionCode =  currentWeatherAllData["condition"]["code"];

     dynamic convertCurrentDate = DateTime.parse(currentWeatherAllData["last_updated"]);
    currentDate = DateFormat('EEEE d MMMM @h:mma').format(convertCurrentDate);

  }
  void getDaysWeatherData(int ? index){

    weatherConditionCode = daysWeatherData[index!]["day"]["condition"]["code"];
    convertedDaysDate = DateTime.parse(daysWeatherData[index]["date"]);
    days = DateFormat('EEEE').format(convertedDaysDate);
    daysCondtion = daysWeatherData[index]["day"]["condition"]["text"];
    daysTempretur =  daysWeatherData[index]["day"]["avgtemp_c"].round().toString();
    daysWindSpeed = daysWeatherData[index]["day"]["maxwind_kph"].toString();
    daysMaxTemp  = daysWeatherData[index]["day"]["maxtemp_c"].toString();
    daysHumidity =daysWeatherData[index]["day"]["avghumidity"].toString();


  }


String getWeatherConditionIcon(int ? index){

    if (weatherConditionCode! >= 1279) {
      return  kThunderStorm;
    } else if (weatherConditionCode! >=1276) {
      return kHeavyRain;
    }
    else if (weatherConditionCode! >=1243) {
      return  kShowers;
    } else if (weatherConditionCode! >=1183 ) {
      return kLightRain;
    } else if (weatherConditionCode! >= 1125) {
      return kSnow;
    } else if (weatherConditionCode! >= 1006) {
      return kHeavyCloud;
    } else if (weatherConditionCode! >=1003) {
      return kLightCloud;
    } else if (weatherConditionCode! <= 1000) {
      return kclear;
    } else {
      return  kDefault;
    }


  }


  String getCurrentWaetherICon(){


    if (currentConditionCode >= 1279) {
      return  kThunderStorm;
    } else if (currentConditionCode >=1276) {
      return kHeavyRain;
    }
    else if (currentConditionCode >=1243) {
      return  kShowers;
    } else if (currentConditionCode >=1183 ) {
      return kLightRain;
    } else if (currentConditionCode >= 1125) {
      return kSnow;
    } else if (currentConditionCode >= 1006) {
      return kHeavyCloud;
    } else if (currentConditionCode >=1003) {
      return kLightCloud;
    } else if (currentConditionCode <= 1000) {
      return kclear;
    } else {
      return  kDefault;
    }

  }






}