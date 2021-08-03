import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ishop_app/data/model/currentlocation.dart';

class LocationApiProvider {
  Future<CurrentLocation> getCurrentLocation() async {
    print("Hello location fetch call........");
    Location location = new Location();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool _serviceEnabled = false;
    late PermissionStatus _permissionGranted;
    late LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return CurrentLocation(
          locationName: '',
          locationAddress: '',
          latitude: 0.0,
          longitude: 0.0
        );
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return CurrentLocation(
          locationName: '',
          locationAddress: '',
          latitude: 0.0,
          longitude: 0.0
        );
      }
    }

    _locationData = await location.getLocation();
    print(_locationData);
    final coordinates =
        new Coordinates(_locationData.latitude, _locationData.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    var second = addresses[1];
    return CurrentLocation(
      locationName: first.featureName,
      locationAddress: second.addressLine,
      latitude: _locationData.latitude,
      longitude: _locationData.longitude

    );
    /* var first = addresses.first;
    var second = addresses[1];
    print("${first.featureName} : ${second.addressLine}");
    return first.featureName;
  setState(() {
      address = first.featureName;
      address_line = second.addressLine;
      prefs.setString("currentLocation", address);
      prefs.setString("address_line", address_line);

      prefs.setInt("test", 1);
    });*/
  }

}
