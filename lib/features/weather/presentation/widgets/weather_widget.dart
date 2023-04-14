import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/weather.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({
    super.key,
    required this.weather, 
    required this.listWeatherForecast,
  });

  final Weather weather;
  final List<WeatherForecast> listWeatherForecast;

  @override
  Widget build(BuildContext context) {

    final dayList = listWeatherForecast.where((value) => value.date == weather.date).toList();

    return Container(
      margin: const EdgeInsets.only(top: 150),
      child: Center(
        child: Column(
          children: [
            Text(weather.city, style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500)),
            Text(weather.day, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 80),
            Image(image: AssetImage('assets/images/${weather.iconWeather}.png'), width: 400,),
            const SizedBox(height: 60),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                      '${weather.temperature}ºC',
                      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'DETAILS',
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(height: 5),
                          const Divider(thickness: 2),
                          const SizedBox(height: 5),
                          Text(
                            'Hoy: ${weather.weather}. La temperatura máxima rondará los ${weather.maxTemperature}º. La humedad es del ${weather.humidity}%.',
                            style: const TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 50),
            GestureDetector(
              onTap: () => showCupertinoDialog<String>(
                context: context,
                builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text(weather.city, textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
                  content: SizedBox(
                    height: 250,
                    width: 300,
                    child: ListView.builder(
                      itemCount: dayList.length,
                      itemBuilder: (context, index) => Text(
                        '${dayList[index].time.substring(0,5)}    ${dayList[index].temperature}º',
                        style: const TextStyle(fontSize: 20),
                      )
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Image(image: AssetImage('assets/images/Wolke/grau.png'))
            )
          ],
        ),
      ),
    );
  }
}