import 'package:ishop_app/data/api/location_api_provider.dart';
import 'package:ishop_app/data/model/currentlocation.dart';

class LocationRepository {
  LocationApiProvider _locationApiProvider = LocationApiProvider();

  Future<CurrentLocation> getCurrentLocation() => _locationApiProvider.getCurrentLocation();
}
