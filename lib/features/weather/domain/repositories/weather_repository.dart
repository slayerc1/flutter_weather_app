import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:weather_app/features/weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeatherData(LatLng position);
  Future<List<Weather>> getForecastDaily(LatLng position);
  Future<List<WeatherForecast>> getWeatherForecast(LatLng position);
}