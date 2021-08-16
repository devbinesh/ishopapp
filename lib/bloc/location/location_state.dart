import 'package:equatable/equatable.dart';
import 'package:ishop_app/data/model/currentlocation.dart';

abstract class LocationState extends Equatable {
  @override
  List<Object> get props => [];

  CurrentLocation get currentLocation => CurrentLocation(locationName: '', locationAddress: '',latitude: 0.0,longitude: 0.0);
}
class LocationInit extends LocationState{

}
class LocationPref extends LocationState {
  final CurrentLocation currentLocation;

  LocationPref(this.currentLocation);
}
class LocationFetched extends LocationState{
  final CurrentLocation currentLocation;
  LocationFetched(this.currentLocation);
}

class LocationChangedState extends LocationState{
  final CurrentLocation currentLocation;
  LocationChangedState(this.currentLocation);
}


