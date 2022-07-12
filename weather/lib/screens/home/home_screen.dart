import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/components/card_items.dart';
import 'package:weather/components/item_card_tap.dart';
import 'package:weather/model/city.dart';
import 'package:weather/screens/home/current_weather_details_container.dart';
import 'package:weather/screens/home/current_weather_sub_container.dart';
import 'package:weather/screens/weather_deatils_days/weather_details_days_screens.dart';
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
  String? location;
  int? onDay;

  List<City> cities = City.getSelectedCities();
  List<String> selectedCities = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < cities.length; i++) {
      selectedCities.add(cities[i].city);
    }
    location = selectedCities[0];
    getCurrentData();

  }

  void getCurrentData() async {
    await weatherData.getData(location);
    setState(() {
      weatherData;
      isLoading = false;
    });
  }

  // bool isToday = true;
  String today = DateFormat('EEEE').format(DateTime.now());
  var date = DateFormat('EEEE, d MMMM @h:mma').format(DateTime.now());



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: isLoading ? null : appBar(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(15),
                  Text(
                    location ?? 'location',
                    style: kHeading,
                  ),
                  Text(
                    weatherData.currentDate??'date time',
                    style: kSubHeading,
                  ),
                  verticalSpace(40.0),
                  CurrentWeatherDetailsContainer(weatherData: weatherData),
                  CurrentWeatherSubContainer(weatherData: weatherData),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Today',
                        style: kTodayTextStyle,
                      ),
                      Text(
                        'Next 3 Days',
                        style: kNext3DaysStyle,
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: weatherData.daysWeatherData.length,
                      itemBuilder: (context, index) {
                        weatherData.getDaysWeatherData(index);
                        return ItemCardOnTap(
                          onClick: () {
                            onDay = index;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationWeatherDetails(
                                  location: location,
                                  onDay: onDay,
                                ),
                              ),
                            );
                          },
                          isToday: DateTime.parse(weatherData.daysWeatherData[0]["date"]) == weatherData.convertedDaysDate ? true : false,
                          location: location,
                          cardItemChild: CardItems(
                            text: weatherData.daysCondtion ?? "weathercondtion here",
                            image: weatherData.getWeatherConditionIcon(index),
                            textResult: weatherData.days.toString(),
                            isWeekResult: true,
                            isToday: DateTime.parse(weatherData.daysWeatherData[0]["date"]) == weatherData.convertedDaysDate ? true : false, 
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

//app bar refactored
  AppBar appBar() {
    return AppBar(
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
        horizontalSpace(10.0),
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
              getCurrentData();
            });
          },
        )),
        horizontalSpace(10.0),
      ],
    );
  }

  SizedBox verticalSpace(double height) {
    return SizedBox(
      height: height,
    );
  }

  SizedBox horizontalSpace(double width) {
    return SizedBox(
      width: width,
    );
  }

  final Shader linearGradiant = const LinearGradient(colors: <Color>[
    Color(0xffABCFF2),
    Color(0xff9AC6F3),
  ]).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
