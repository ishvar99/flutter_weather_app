import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatelessWidget {
  void getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clime'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
