import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:ishop_app/bloc/location/location_event.dart';
import 'package:ishop_app/bloc/location/location_state.dart';
import 'package:ishop_app/data/api/location_repository.dart';
import 'package:ishop_app/data/model/currentlocation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc(LocationState initialState) : super(initialState);

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (event is LocationFetch) {
      final location = await LocationRepository().getCurrentLocation();
      prefs.setString('current_location', jsonEncode(location.toJson()));
      yield LocationFetched(location);
    }
    if (event is LocationInitial) {
      String? location = await prefs.getString("current_location");
      print(location);
      Map locationMap = jsonDecode(location!);
      var currentLocation = CurrentLocation.fromJson(locationMap);
      yield LocationPref(currentLocation);
    }

    if (event is LocationChanged) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? location = await prefs.getString("current_location");
      Map locationMap = jsonDecode(location!);
      var currentLocation = CurrentLocation.fromJson(locationMap);

      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => PlacePicker(
            apiKey:
                "AIzaSyDVELlCwDJsQFDtKL9d_3iyCWlY3Aj_UTg", // Put YOUR OWN KEY here.
            onPlacePicked: (result) {
              CurrentLocation location =
                  LocationRepository().getLocationObject();
              location.longitude = result.geometry?.location.lng ?? 0.0;
              location.latitude = result.geometry?.location.lat ?? 0.0;
              location.locationAddress = result.formattedAddress!;
              location.locationName = result.addressComponents?.first?.longName as String;

              prefs.setString(
                  'current_location', jsonEncode(location.toJson()));

              BlocProvider.of<LocationBloc>(event.context)
                  ..add(LocationChangedOut());
              Navigator.of(context).pop();
            },
            initialPosition:
                LatLng(currentLocation.latitude, currentLocation.longitude),
            useCurrentLocation: true,
          ),
        ),
      );
    }

    if (event is LocationChangedOut) {
      String? location = await prefs.getString("current_location");
      Map locationMap = jsonDecode(location!);
      var currentLocation = CurrentLocation.fromJson(locationMap);
      yield LocationChangedState(currentLocation);
    }
  }
}
