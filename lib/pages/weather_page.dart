import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String greeting = 'It is good to have you here!';
  String location = '';
  String weather = '';

  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
  }

  Future<void> _getLocationAndWeather() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        location = 'Latitude: ${position.latitude}, Longitude: ${position.longitude}';
      });

      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=778c1d5d335b3d67f39842f5839156dd&units=imperial'));
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          double tempInFahrenheit = data['main']['temp'];
          weather = 'Temperature: ${tempInFahrenheit.toStringAsFixed(1)} °F';
        });
      } else {
        setState(() {
          weather = 'Failed to fetch weather data';
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        location = 'Failed to fetch location';
        weather = 'Failed to fetch weather data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Image.asset(
                  'lib/images/logo.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 20),
                Text(
                  greeting,
                  style: TextStyle(
                    color: Color(0xFFF05C59),
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 25),
                Center(
                  child: Text(
                    location,
                    style: TextStyle(
                      color: Color(0xFFF05C59),
                      fontSize: 12, // Adjusted font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  weather,
                  style: TextStyle(
                    color: Color(0xFFF05C59),
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
