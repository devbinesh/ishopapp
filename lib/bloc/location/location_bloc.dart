import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoder/geocoder.dart';
import 'package:ishop_app/bloc/location/location_event.dart';
import 'package:ishop_app/bloc/location/location_state.dart';
import 'package:ishop_app/data/api/location_repository.dart';
import 'package:ishop_app/data/model/currentlocation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationState initialState) : super(initialState);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event is LocationFetch) {
      final location = await LocationRepository().getCurrentLocation();
      prefs.setString('current_location', jsonEncode(location.toJson()));
      yield LocationChanged(location);
    }
    if (event is LocationInitial) {
      String? location = await prefs.getString("current_location");
      Map locationMap = jsonDecode(location!);
      var currentLocation = CurrentLocation.fromJson(locationMap);
      yield LocationPref(currentLocation);
    }
  }
}
