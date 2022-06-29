import 'package:flutter/material.dart';
import 'package:weather/model/city.dart';
import 'package:weather/utilities/constants.dart';

class CitySelected extends StatefulWidget {
  const CitySelected({Key? key}) : super(key: key);

  @override
  State<CitySelected> createState() => _CitySelectedState();
}

class _CitySelectedState extends State<CitySelected> {
  List<City> cities =
      City.citiesList.where((city) => city.isDefault == false).toList();
  List<City> selectedCity = City.getSelectedCities();

  @override
  Widget build(BuildContext context) {
    print(cities);
    print('rebuild');
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
          title: Text('${selectedCity.length.toString()} Selected'),
          centerTitle: true,
          toolbarHeight: kAppBarHeight,
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10.0,
                ),
            itemCount: cities.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 4,
                shadowColor: kSecondaryColor.withOpacity(.6),
                child: ListTile(
                  dense: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                    side: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                  ),
                  tileColor: kPrimaryColor.withOpacity(.2),
                  contentPadding: const EdgeInsets.all(15.0),
                  leading: Image(
                    image: AssetImage(cities[index].isSelected == true
                        ? 'assets/images/checked.png'
                        : 'assets/images/unchecked.png'),
                    width: 30,
                  ),
                  onTap: () {
                    setState(() {
                      cities[index].isSelected = !cities[index].isSelected;
                      selectedCity = City.getSelectedCities();
                      print(selectedCity.length);
                    });
                  },
                  title: Text(
                    cities[index].city,
                    style: TextStyle(
                        color: cities[index].isSelected == true
                            ? kSecondaryColor
                            : Colors.black54),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: (){},
          backgroundColor: kSecondaryColor,
          child: const Icon(Icons.pin_drop),
        ),
      ),
    );
  }
}
