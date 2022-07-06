import 'package:flutter/material.dart';
import 'package:weather/screens/location_weather_details.dart';

class ItemCardOnTap extends StatelessWidget {
  const ItemCardOnTap({
    required this.cardItemChild,
    this.location,
    Key? key}) : super(key: key);

  final Widget  cardItemChild;
  final String  ? location;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
        onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationWeatherDetails(location: location,)));

    },
    child: Card(
    margin: const EdgeInsets.fromLTRB(0.0, 15.0, 5.0, 10.0),

    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
    child: cardItemChild,
    ),
    ),);
  }
}
