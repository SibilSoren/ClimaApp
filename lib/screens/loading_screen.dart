import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ClimaApp/services/location.dart';
import 'package:http/http.dart';
import 'package:ClimaApp/services/networking.dart';
import 'package:ClimaApp/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ClimaApp/services/weather.dart';

const apiKey = 'b8be62ef88196ba2a088319c16a07c4c';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Init statement is called ');
    getLocation();

  }

  void getLocation()async{

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData);
    }));



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        )
      ),
    );
  }
}
