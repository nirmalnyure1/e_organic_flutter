import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider extends ChangeNotifier {
  double? latitude;
  double? longitude;
  bool? permission = false;
  var selectedAddress;

  Future<void> getCurrentPostion() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
    if (position != null) {
      this.permission = true;
      this.latitude = position.latitude;
      this.longitude = position.longitude;
      notifyListeners();
    } else {
      print("permission is not allowed");
    }
  }

  void onCameraMove(CameraPosition cameraPosition) async {
    this.latitude = cameraPosition.target.latitude;
    this.longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  Future<void> getCameraMove() async {
    final coordinates = Coordinates(this.latitude, this.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    selectedAddress = addresses.first;
    print('${selectedAddress.featureName}:${selectedAddress.addressLine}}');
  }
}
