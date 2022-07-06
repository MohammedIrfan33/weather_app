import 'package:flutter/material.dart';


//color

const Color kPrimaryColor = Color(0xFF90B2F9);
const Color kSecondaryColor = Color(0xFF90B2F8);
const Color kCardItemsContainerColor =  Color(0xffE0E8FB);

const LinearGradient gradientColor =  LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.center,
  colors: [
    Color(0xffa9c1f5),
    Color(0xff6696f5)
  ],
);
//app bar height

const kAppBarHeight = 70.0;

//textstyle

const kHeading = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontSize: 30.0,
);

const kSubHeading = TextStyle(
  color: Colors.grey,
  fontSize: 16
);

const kWeatherStatusStyle = TextStyle(
  color:Colors.white,
  fontSize: 20.0
);

const kCardItemStyle = TextStyle(
    color: Colors.grey,
    fontSize: 12.0
);

const kCardItemsTextResultStyle = TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w600
);

const kNext7DaysStyle = TextStyle(
  color: kPrimaryColor,
  fontSize: 17,
  fontWeight: FontWeight.w500,
);







