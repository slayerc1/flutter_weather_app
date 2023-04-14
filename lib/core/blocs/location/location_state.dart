part of 'location_bloc.dart';

class LocationState extends Equatable {
   final LatLng? currentLocation;

  const LocationState(this.currentLocation);

  LocationState copyWith({
    LatLng? currentLocation
  }) => LocationState(currentLocation ?? this.currentLocation);
  
  @override
  List<Object?> get props => [currentLocation];
}