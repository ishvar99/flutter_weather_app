import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen({this.locationWeather});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  int condition;
  String cityName;
  void updateUI(dynamic weatherData) {
    temperature = weatherData['main']['temp'].toInt();
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
  }

  @override
  void initState() {
    updateUI(widget.locationWeather);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/waterfall.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.near_me,
                      size: 42,
                    ),
                    Icon(
                      Icons.location_city,
                      size: 42,
                    )
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: TextStyle(
                            fontSize: 72,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      Text(
                        '☀',
                        style: TextStyle(fontSize: 50),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "It's🍦time in San Fransisco!",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
