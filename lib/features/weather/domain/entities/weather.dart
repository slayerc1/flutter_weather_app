import 'dart:convert';

class Weather {

  String city;
  String day;
  String date;
  String weather;
  String iconWeather;
  int temperature;
  int maxTemperature;
  int humidity;
  List<Map<String, String>>? forecast; 

  Weather({
    required this.city,
    required this.day,
    required this.date,
    required this.weather,
    required this.iconWeather,
    required this.temperature,
    required this.maxTemperature,
    required this.humidity,
    this.forecast
  });

}

class WeatherForecast {
  String time;
  String date;
  int temperature;

  WeatherForecast({
    required this.time,
    required this.date,
    required this.temperature
  });
  
}