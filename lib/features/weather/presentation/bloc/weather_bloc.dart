import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_app/features/weather/domain/entities/weather.dart';
import 'package:weather_app/features/weather/domain/repositories/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository repository;

  WeatherBloc(this.repository) : super(const WeatherState(selectedMenuOpt: 0)) {
    on<GetCurrentWeatherDataEvent>(_getCurrentWeatherData);
    on<GetDailyForecastEvent>(_getDailyForecast);
    on<GetWeatherForecastEvent>(_getWeatherForecast);
    on<OnChangeTab>((event, emit) => emit(state.copyWith(selectedMenuOpt: event.index)));
  }

  Future<void> _getCurrentWeatherData(GetCurrentWeatherDataEvent event, Emitter<WeatherState> emit) async {
    final weather = await repository.getCurrentWeatherData(event.position);
    emit(state.copyWith(listWeather: [weather]));
  }

  Future<void> _getDailyForecast(GetDailyForecastEvent event, Emitter<WeatherState> emit) async {
    final listWeather = await repository.getForecastDaily(event.position);
    emit(state.copyWith(listWeather: listWeather));
  }

  Future<void> _getWeatherForecast(GetWeatherForecastEvent event, Emitter<WeatherState> emit) async {
    final listWeatherForecast = await repository.getWeatherForecast(event.position);
    emit(state.copyWith(listWeatherForecast: listWeatherForecast));
  }
}
