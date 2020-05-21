import 'package:flutter/material.dart';
import '../utilities/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = '0d53000d71637dcfd51c4c413afe1fb6';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  double lat;
  double long;
  void setCoordinates() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;
  }

  @override
  void initState() {
    print('init state called');
    setCoordinates();
    super.initState();
  }

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
    if (response.statusCode == 200) {
      String data = response.body;
      var temperature = json.decode(data)['main']['temp'];
      var id = json.decode(data)['weather'][0]['id'];
      var city = json.decode(data)['name'];
      print(temperature);
      print(id);
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('Clime'),
      ),
    );
  }
}
