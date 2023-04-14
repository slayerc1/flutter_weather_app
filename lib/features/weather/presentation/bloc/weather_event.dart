part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class GetCurrentWeatherDataEvent extends WeatherEvent {
  final LatLng position;

  const GetCurrentWeatherDataEvent(this.position);
}

class GetDailyForecastEvent extends WeatherEvent {
  final LatLng position;

  const GetDailyForecastEvent(this.position);
}

class GetWeatherForecastEvent extends WeatherEvent {
  final LatLng position;

  const GetWeatherForecastEvent(this.position);
}

class OnChangeTab extends WeatherEvent {
  final int index;

  const OnChangeTab(this.index);
}
