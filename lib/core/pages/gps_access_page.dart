import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/blocs/gps/gps_bloc.dart';

class GpsAccessPage extends StatelessWidget {
   
  const GpsAccessPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
         child: BlocBuilder<GpsBloc, GpsState>(
          builder: (context, state) {
            return !state.isGpsEnable
              ? const _EnableGpsMessage()
              : const _AccessButton();
          },
         )
      ),
    );
  }
}

class _AccessButton extends StatelessWidget {
  const _AccessButton();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('GPS access is required', style: TextStyle(fontSize: 25)),
        MaterialButton(
          onPressed: () {
            final gpsBloc = BlocProvider.of<GpsBloc>(context);
            gpsBloc.askGpsAccess();
          },
          color: Colors.black,
          shape: const StadiumBorder(),
          elevation: 0,
          splashColor: Colors.transparent,
          child: const Text('Request Access', style: TextStyle(fontSize: 18,color: Colors.white)),
        )
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'You must enable GPS',
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300)
    );
  }
}