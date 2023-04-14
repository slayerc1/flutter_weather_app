import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

import 'core/service_locator/service_locator.dart';

import 'package:weather_app/core/blocs/gps/gps_bloc.dart';
import 'package:weather_app/core/blocs/location/location_bloc.dart';
import 'package:weather_app/features/weather/presentation/pages/pages.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => getIt<GpsBloc>()),
      BlocProvider(create: (context) => getIt<LocationBloc>()),
      BlocProvider(create: (context) => getIt<WeatherBloc>())
    ],
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LocationBloc>(context);

    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoadingPage(),
    );
  }
}
