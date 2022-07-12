import 'package:flutter/material.dart';
import 'package:weather/screens/weather_deatils_days/weather_details_days_screens.dart';
import 'package:weather/utilities/constants.dart';

class ItemCardOnTap extends StatelessWidget {
   ItemCardOnTap({
    required this.cardItemChild,
    this.isToday = false,
    this.location,
    required this.onClick,
     this.isDay=false,
     this.isWeatherDaysData =false,
    Key? key}) : super(key: key);

  final Widget  cardItemChild;
  final String  ? location;
  final bool  isToday;
  final Function onClick;
   final bool  isDay;
   final bool  isWeatherDaysData;

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: GestureDetector(
          onTap: (){
        onClick();

      },
      child: Card(
      margin: const EdgeInsets.fromLTRB(0.0, 15.0, 5.0, 10.0),
      color: isToday || isDay ? Color(0xffa9c1f5) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
      child: cardItemChild,
      ),
      ),),
    );
  }
}
