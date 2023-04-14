import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/core/blocs/location/location_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:weather_app/features/weather/presentation/widgets/widgets.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    final position = BlocProvider.of<LocationBloc>(context).state.currentLocation!;
    final weatherBloc = BlocProvider.of<WeatherBloc>(context); 

    weatherBloc.add(GetDailyForecastEvent(position));
    weatherBloc.add(GetWeatherForecastEvent(position));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state.listWeather == null || state.listWeatherForecast == null) return const Center(child: CircularProgressIndicator.adaptive());

            return WeatherWidget(weather: state.listWeather![state.selectedMenuOpt], listWeatherForecast: state.listWeatherForecast!);
          },
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}

