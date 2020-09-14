import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    // WeatherModel weathermod = WeatherModel();
    var weatherdata = await WeatherModel().getlocationweather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherdata);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(color: Colors.red, size: 100.0),
      ),
    );
  }
}

// https://api.openweathermap.org/data/2.5/weather?lat=31.74&lon=30.29&appid=8050df11be6b64436f63695db5d95e69
// https://api.openweathermap.org/data/2.5/weather?lat=31.74&lon=30.29appid=8050df11be6b64436f63695db5d95e69
