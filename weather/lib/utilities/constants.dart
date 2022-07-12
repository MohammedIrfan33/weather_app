import 'package:flutter/material.dart';

//color

const Color kPrimaryColor = Color(0xFF90B2F9);
const Color kSecondaryColor = Color(0xFF90B2F8);
const Color kCardItemsContainerColor = Color(0xffE0E8FB);
const Color kCardItemsDaysWeatherColor = Colors.black54;

const LinearGradient gradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.center,
  colors: [Color(0xffa9c1f5), Color(0xff6696f5)],
);
//app bar height

const kAppBarHeight = 70.0;

//textstyle

const kHeading = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kSubHeading = TextStyle(color: Colors.grey, fontSize: 16);

const kWeatherStatusStyle = TextStyle(color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w400);

const kCardItemStyle = TextStyle(color: Colors.grey, fontSize: 12.0);

const kCardItemsTextResultStyle = TextStyle();

const kNext3DaysStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);

const kTodayTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
);

//images icon

const String kHeavyCloud = 'assets/images/heavycloud.png';
const String kHeavyRain = 'assets/images/heavyrain.png';
const String kHumidity = 'assets/images/humidity.png';
const String kLightCloud = 'assets/images/lightcloud.png';
const String kLightRain = 'assets/images/lightrain.png';
const String kShowers = 'assets/images/showers.png';
const String kSleet = 'assets/images/sleet.png';
const String kSnow = 'assets/images/snow.png';
const String kThunderStorm = 'assets/images/thunderstorm.png';
const String kclear = 'assets/images/clear.png';
const String kDefault = 'assets/images/defaultCondtion.png';
