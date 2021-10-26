import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  double? latitude;
  double? longitude;
  bool? permission = false;
  bool?   loding=false;
  var selectedAddress;

  Future<void> getCurrentPostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    if (position != null) {
      permission = true;
      latitude = position.latitude;
      longitude = position.longitude;

      final coordinates = Coordinates(latitude,longitude);
      final addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      selectedAddress = addresses.first;
      notifyListeners();
    } else {
      print("permission is not allowed");
    }
  }

  void getCoordinatedsOnCameraMove(CameraPosition cameraPosition) async {
    latitude = cameraPosition.target.latitude;
    longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  Future<void> getAddressOnCameraMove() async {
    final coordinates = Coordinates(latitude,longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    selectedAddress = addresses.first;
    notifyListeners();
    print('${selectedAddress.featureName}:${selectedAddress.addressLine}}');
  }
}
