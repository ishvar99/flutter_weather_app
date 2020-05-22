import 'package:flutter/material.dart';
import '../services/network_helper.dart';
import '../utilities/location.dart';
import '../screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '0164fd3ac956c6805967ca5242d6045a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;
  void setCoordinates() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.latitude;
    long = location.longitude;
    print('latitude: $lat');
    print('longitude: $long');
    NetworkHelper network = NetworkHelper(
        url:
            'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var weatherData = await network.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => LocationScreen(
                locationWeather: weatherData,
              )),
    );
  }

  @override
  void initState() {
    print('init state called');
    super.initState();
    setCoordinates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clime'),
      ),
      body: Center(
          child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      )),
    );
  }
}
