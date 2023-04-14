import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/gps/gps_bloc.dart';

import 'package:weather_app/core/pages/pages.dart';
import 'package:weather_app/features/weather/presentation/pages/pages.dart';

class CheckPage extends StatelessWidget {
   
  const CheckPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return state.isAllGranted
            ? const LoadingPage()
            : const GpsAccessPage();
        },
      )
    );
  }
}