import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:weather_app/features/weather/data/datasources/weather_datasource.dart';
import 'package:weather_app/features/weather/data/models/current_weather_response.dart';
import 'package:weather_app/features/weather/data/models/daily_forecast_response.dart';
import 'package:weather_app/features/weather/data/models/image_mapper.dart';
import 'package:weather_app/features/weather/data/models/weather_forecast_response.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

@Injectable(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherDatasource weatherDatasource;

  WeatherRepositoryImpl(this.weatherDatasource);

  @override
  Future<Weather> getCurrentWeatherData(LatLng position) async {
    final CurrentWeatherResponse currentWeather = await weatherDatasource.getCurrentWeatherData(position) as CurrentWeatherResponse;
    final date = DateTime.fromMillisecondsSinceEpoch(currentWeather.dt * 1000);
    final formatter = DateFormat('yyyy-MM-dd');

    final weather = Weather(
      city: currentWeather.name, 
      day: DateFormat('EEEE').format(date),
      date: formatter.format(date),
      weather: currentWeather.weather[0].description, 
      iconWeather: ImageMapper.getImage(currentWeather.weather[0].icon), 
      temperature: (currentWeather.main.temp - 274.15).round(), 
      maxTemperature: (currentWeather.main.tempMax - 274.15).round(), 
      humidity: currentWeather.main.humidity.round()
    );

    return weather;
  }
  
  @override
  Future<List<Weather>> getForecastDaily(LatLng position) async {
    final DailyForecastResponse dailyForecast = await weatherDatasource.getDailyForecast(position) as DailyForecastResponse;

    final List<Weather> listWeather = [];

    for (final daily in dailyForecast.list) {
      final date = DateTime.fromMillisecondsSinceEpoch(daily.dt * 1000);
      final formatter = DateFormat('yyyy-MM-dd');

      final weather = Weather(
        city: dailyForecast.city.name, 
        day: DateFormat('EEEE').format(date), 
        date: formatter.format(date),
        weather: daily.weather[0].description, 
        iconWeather: ImageMapper.getImage(daily.weather[0].icon), 
        temperature: (daily.temp.day - 274.15).round(), 
        maxTemperature: (daily.temp.max - 274.15).round(), 
        humidity: daily.humidity.round()
      );

      listWeather.add(weather);
    }

    return listWeather;
  }
  
  @override
  Future<List<WeatherForecast>> getWeatherForecast(LatLng position) async {
    final WeatherForecastResponse weatherForecast = await weatherDatasource.getWeatherForecast(position) as WeatherForecastResponse;

    final List<WeatherForecast> listWeatherForecast = [];

    for (final weatherData in weatherForecast.list) {
      final date = DateTime.fromMillisecondsSinceEpoch(weatherData.dt * 1000);
      final formatter = DateFormat('yyyy-MM-dd');

      final weatherForecast = WeatherForecast(
        time: DateFormat.Hms().format(date), 
        date: formatter.format(date),
        temperature: (weatherData.main.temp - 274.15).round(), 
      );

      listWeatherForecast.add(weatherForecast);
    }

    return listWeatherForecast;
  }
}