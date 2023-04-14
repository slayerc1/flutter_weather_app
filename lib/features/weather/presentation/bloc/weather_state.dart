part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  final List<Weather>? listWeather;
  final List<WeatherForecast>? listWeatherForecast;
  final int selectedMenuOpt;

  const WeatherState({
    required this.selectedMenuOpt, 
    this.listWeather,
    this.listWeatherForecast
  });  

  WeatherState copyWith({
    int? selectedMenuOpt, 
    List<Weather>? listWeather,
    List<WeatherForecast>? listWeatherForecast
  }) => WeatherState(
    selectedMenuOpt: selectedMenuOpt ?? this.selectedMenuOpt, 
    listWeather: listWeather ?? this.listWeather,
    listWeatherForecast: listWeatherForecast ?? this.listWeatherForecast
  );

  @override
  List<Object?> get props => [listWeather, listWeatherForecast, selectedMenuOpt];
}
