import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:injectable/injectable.dart';

part 'location_event.dart';
part 'location_state.dart';

@injectable
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState(null)) {
    on<OnNewLocationEvent>((event, emit) => emit(state.copyWith(currentLocation: event.newLocation)));
    _init();
  }

  Future<void> _init() async {
    try {
      final position = await Geolocator.getCurrentPosition();
      add(OnNewLocationEvent(LatLng(position.latitude, position.longitude)));
    } catch (e) {
      print(e);
    }
  }
  

}
