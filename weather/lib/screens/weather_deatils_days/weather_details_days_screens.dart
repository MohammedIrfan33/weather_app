import 'package:flutter/material.dart';
import 'package:weather/components/card_items.dart';
import 'package:weather/components/item_card_tap.dart';
import 'package:weather/components/weather_stack.dart';
import 'package:weather/screens/home/home_screen.dart';
import 'package:weather/servieces/current_weather.dart';
import 'package:weather/utilities/constants.dart';

class LocationWeatherDetails extends StatefulWidget {
  const LocationWeatherDetails({this.location, required this.onDay, Key? key})
      : super(key: key);
  final String? location;
  final int? onDay;

  @override
  State<LocationWeatherDetails> createState() => _LocationWeatherDetailsState();
}

class _LocationWeatherDetailsState extends State<LocationWeatherDetails> {
  int? isDay;
  bool? isCheckDay;
  WeatherAllData weatherDaysData = WeatherAllData();
  bool isLoading = true;

  @override
  initState() {
    super.initState();
    getDaysAllData();
    isDay = widget.onDay;
  }

  void getDaysAllData() async {
    await weatherDaysData.getData(widget.location);
    isLoading = false;
    setState(() {
      weatherDaysData;
      weatherDaysData.getDaysWeatherData(widget.onDay);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.location ?? 'location',
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    width: size.width,
                    height: size.height / 4,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherDaysData.daysWeatherData.length,
                      itemBuilder: (context, index) {
                        weatherDaysData.getDaysWeatherData(index);

                        return SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: ItemCardOnTap(
                              onClick: () {
                                setState(() {
                                  isDay = index;
                                  weatherDaysData.getDaysWeatherData(isDay);
                                });
                              },
                              isDay: isDay == index ? true : false,
                              isWeatherDaysData: true,
                              cardItemChild: CardItems(
                                text:
                                    weatherDaysData.daysCondtion ?? 'condition',
                                image: weatherDaysData
                                    .getWeatherConditionIcon(isDay),
                                textResult: weatherDaysData.days ?? 'day',
                                isWeekResult: true,
                                isDay: isDay == index ? true : false,
                              ),
                            ));
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    width: size.width,
                    height: size.height / 2.5,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(70.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height / 3,
                  left: 15.0,
                  right: 15.0,
                  child: Container(
                    width: size.width * .7,
                    height: size.height / 2,
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
                        ]),
                    child: Column(
                      children: [
                        Expanded(
                          child: WeatherStack(
                            temprature: weatherDaysData.daysTempretur,
                            condition: weatherDaysData.daysCondtion,
                            conditionIcon:
                                weatherDaysData.getWeatherConditionIcon(isDay),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CardItems(
                                  color: kCardItemsDaysWeatherColor,
                                  text: 'Wind Speed',
                                  image: 'assets/images/windspeed.png',
                                  textResult:
                                      '${weatherDaysData.daysWindSpeed ?? 'windspeed'}km/h',
                                  isWeekResult: false,
                                ),
                                CardItems(
                                  color: kCardItemsDaysWeatherColor,
                                  text: 'Humidity',
                                  image: 'assets/images/humidity.png',
                                  textResult: weatherDaysData.daysHumidity ??
                                      'humidity',
                                  isWeekResult: false,
                                ),
                                CardItems(
                                  color: kCardItemsDaysWeatherColor,
                                  text: 'max Temp',
                                  image: 'assets/images/max-temp.png',
                                  textResult: '${weatherDaysData.daysMaxTemp}C',
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
