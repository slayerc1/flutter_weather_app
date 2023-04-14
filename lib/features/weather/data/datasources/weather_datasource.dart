import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:weather_app/features/weather/data/models/current_weather_response.dart';
import 'package:weather_app/features/weather/data/models/daily_forecast_response.dart';
import 'package:weather_app/features/weather/data/models/weather_forecast_response.dart';

@injectable
class WeatherDatasource {
  final _baseUrl = 'api.openweathermap.org';
  final _appid = 'b73b624979a3ffaa51d0475f04bccd85';

  Future<CurrentWeatherResponse?> getCurrentWeatherData(LatLng position) async {
    try {
      final url = Uri.https(_baseUrl, '/data/2.5/weather', {
        'appid': _appid,
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'lang': 'es'
      });
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return CurrentWeatherResponse.fromRawJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<DailyForecastResponse?> getDailyForecast(LatLng position) async {
    try {
      final url = Uri.https(_baseUrl, '/data/2.5/forecast/daily', {
        'appid': _appid,
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'cnt': '2',
        'lang': 'es'
      });
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return DailyForecastResponse.fromRawJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<WeatherForecastResponse?> getWeatherForecast(LatLng position) async {
    try {
      final url = Uri.https(_baseUrl, '/data/2.5/forecast', {
        'appid': _appid,
        'lat': position.latitude.toString(),
        'lon': position.longitude.toString(),
        'lang': 'es'
      });
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return WeatherForecastResponse.fromRawJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
