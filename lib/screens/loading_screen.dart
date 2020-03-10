import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const apiKey = '59e92f14dd3cf9c6fc172c0fa425c660';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }
  void getLocationData() async{
    LocationInfo locInfo = LocationInfo();
    await locInfo.getCurrentLocation();
    latitude = locInfo.latitude;
    longitude = locInfo.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://samples.openweathermap'
                                                    '.org/data/2'
                                                    '.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold ();
  }
}
