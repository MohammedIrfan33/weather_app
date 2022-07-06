import 'package:flutter/material.dart';
import 'package:weather/components/card_items.dart';
import 'package:weather/components/item_card_tap.dart';
import 'package:weather/components/reuseable_text.dart';
import 'package:weather/components/weather_stack.dart';
import 'package:weather/utilities/constants.dart';

class LocationWeatherDetails extends StatefulWidget {
  LocationWeatherDetails(

      {
        this.location,
        Key? key}) : super(key: key);

   String ? location ;

  @override
  State<LocationWeatherDetails> createState() => _LocationWeatherDetailsState();
}

class _LocationWeatherDetailsState extends State<LocationWeatherDetails> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(widget.location??'Locations'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.settings,
            ),
          )
        ],
      ),
      body: Stack(

        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              width: size.width,
              height: size.height /4.5,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ItemCardOnTap(
                    cardItemChild: CardItems(
                      text: 'ji',
                      image: 'assets/images/snow.png',
                      textResult: 'monday',
                      isWeekResult: true,
                    ),
                  );
                },
              ),
            ),
          ),

          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Container(
                width: size.width,
                height: size.height / 2,
                decoration: const  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(80.0),
                    ),

                ),

            ),

          ),
          Positioned(
            top: size.height/3.8,
            left: 15.0,
            right: 15.0,
            child: Container(
              width: size.width * .7,
              height: size.height/2.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: gradientColor,
                  boxShadow: [
                    BoxShadow(
                      color: kPrimaryColor.withOpacity(.6),
                      offset: const Offset(0, 25),
                      spreadRadius: -12,
                      blurRadius: 10,
                    )
                  ]

              ),
              child: Column(
                children: [
                  Expanded(
                    child: WeatherStack(),
                  ),
                  Expanded(
                    child: Padding(

                      padding: const EdgeInsets.only(bottom: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CardItems(
                            color: Colors.black,
                            text: 'Wind Speed',
                            image: 'assets/images/windspeed.png',
                            textResult: '20km/h',
                            isWeekResult: false,
                          ),
                          CardItems(
                            color: Colors.black,
                            text: 'Humidity',
                            image: 'assets/images/humidity.png',
                            textResult: '20',
                            isWeekResult: false,
                          ),
                          CardItems(
                            color: Colors.black,
                            text: 'max Temp',
                            image: 'assets/images/max-temp.png',
                            textResult: '40C',
                            isWeekResult: false,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
