import 'package:ClimaApp/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Weather'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/citypagebg.jfif'),
                fit: BoxFit.fill
            )
        ),
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.grey),
              decoration: kTextFieldDecoration,
              onChanged: (value) {
                cityName = value;
              },
            ),
            SizedBox(
              height: 25.0,
            ),
            FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context,cityName);
                },
                icon: Icon(Icons.check),
                label: Text('Get Weather'))
          ],
        ),
      ),
    );
  }
}
