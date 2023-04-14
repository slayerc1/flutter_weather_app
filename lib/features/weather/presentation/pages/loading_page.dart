import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/location/location_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/pages.dart';

class LoadingPage extends StatelessWidget {
   
  const LoadingPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return state.currentLocation != null
            ? const WeatherPage()
            : const Center(child: CircularProgressIndicator.adaptive());
        },
      )
    );
  }
}