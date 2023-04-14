import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/bloc/weather_bloc.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    const selectedColor = Color.fromARGB(255, 245, 222, 20);
    const unselectedColor = Color.fromARGB(255, 145, 143, 143);

    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        return BottomNavigationBar(
          onTap: (i) {
            final weatherBloc = BlocProvider.of<WeatherBloc>(context);
            weatherBloc.add(OnChangeTab(i));
          },
          currentIndex: state.selectedMenuOpt,
          backgroundColor: Colors.grey[200],
          selectedItemColor: selectedColor,
          unselectedItemColor: unselectedColor,
          items: [
            BottomNavigationBarItem(
                icon: Image(
                    image: const AssetImage('assets/images/Icon/hoy.png'),
                    color: state.selectedMenuOpt == 0 ? selectedColor : unselectedColor
                ),
                label: 'Hoy'),
            BottomNavigationBarItem(
                icon: Image(
                    image: const AssetImage('assets/images/Icon/mañana.png'),
                    color: state.selectedMenuOpt == 1 ? selectedColor : unselectedColor
                ),
                label: 'Mañana')
          ],
        );
      },
    );
  }
}
