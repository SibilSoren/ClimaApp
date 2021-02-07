import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ClimaApp/utilities/constants.dart';
import 'package:ClimaApp/services/weather.dart';
import 'package:ClimaApp/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();

  int temperature;
  String tempMsg;
  String weatherIcon;
  var condition;
  var cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        tempMsg = 'Unable to get weather data';
        cityName = '';
        return;
      }
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      weatherIcon = weatherModel.getWeatherIcon(condition);
      tempMsg = weatherModel.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mainpagebg.jpg'),
              fit: BoxFit.fill
            )
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(icon: Icon(Icons.near_me), onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.location_city),
                            onPressed: () async {
                             var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return CityScreen();
                                  },
                                ),
                              );
                             if(typedName != null){
                               var weatherData =  await weatherModel.getCityWeather(typedName);
                               updateUI(weatherData);
                             }
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Column(
                    children: [
                      Text(
                        'Temperature',
                        style: kTitleStyle(),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        temperature.toString() + '°c',
                        style: kTempStyle(),
                      ),
                      SizedBox(
                        height: 55.0,
                      ),
                      Text(
                        'Condition',
                        style: kTitleStyle(),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        weatherIcon,
                        style: kTextStyle(),
                      ),
                      SizedBox(
                        height: 55.0,
                      ),
                      Text(
                        'Location',
                        style: kTitleStyle(),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        cityName,
                        style: kTempStyle(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
