import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/components/card_items.dart';
import 'package:weather/components/item_card_tap.dart';
import 'package:weather/components/weather_stack.dart';
import 'package:weather/model/city.dart';
import 'package:weather/model/location_details.dart';
import 'package:weather/servieces/current_weather.dart';
import 'package:weather/utilities/constants.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  WeatherAllData weatherData = WeatherAllData();
   bool isLoading = true;


  @override
  void initState(){
    super.initState();
    getCurrentData();
  }

  void  getCurrentData() async{
    await  weatherData.getData();
    setState((){
      weatherData;
      isLoading = false;
    });
  }

   String? location;

   String ? condition;
   double ?windSpeed;
   int ? humidity;
   double ? maxTemp;

  // bool isToday = true;

  final Shader linearGradiant = const LinearGradient(colors: <Color>[
    Color(0xffABCFF2),
    Color(0xff9AC6F3),
  ]).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  List<City> cities = City.getSelectedCities();
  List<String> selectedCities = ['london'];

  var date = DateFormat('EEEE, d MMMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(weatherData.temprature);
    return isLoading ?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
        :
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          margin: const EdgeInsets.only(top: 10.0, left: 10.00),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/profile.png',
            ),
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/pin.png',
            width: 20.0,
            height: 20.0,
          ),
          const SizedBox(
            width: 10.0,
          ),
          DropdownButtonHideUnderline(
              child: DropdownButton(
            hint: Text(selectedCities[0]),
            value: location,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: selectedCities.map((String location) {
              return DropdownMenuItem(value: location, child: Text(location));
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                location = newValue!;
              });
            },
          )),
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Text(
              location ?? selectedCities[0],
              style: kHeading,
            ),
            Text(
              date.toString(),
              style: kSubHeading,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Container(
                width: size.width,
                height: 180.0,
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
                  temprature:weatherData.temprature,
                  condition: weatherData.condition,
                ),),
            Container(
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Today',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Next 7 Days',
                  style: kNext7DaysStyle,
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: weatherData.weeklydata.length,
                itemBuilder: (context, index) {
                  print(weatherData.weeklydata[index]["date"]);
                  return ItemCardOnTap(
                    cardItemChild: CardItems(
                      text: 'ji',
                      image: 'assets/images/snow.png',
                      textResult: weatherData.weeklydata[index]["date"],
                      isWeekResult: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
