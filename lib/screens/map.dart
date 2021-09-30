import 'package:eorganic/provider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentLocation;
  GoogleMapController? _mapController;
  @override
  Widget build(BuildContext context) {
    final userLocation = Provider.of<LocationProvider>(context);
    setState(() {
      currentLocation = LatLng(userLocation.latitude!, userLocation.longitude!);
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: currentLocation!, zoom: 14.4746),
              zoomControlsEnabled: true,
              minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.8),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              mapType: MapType.normal,
              mapToolbarEnabled: true,
              onCameraMove: (CameraPosition position) {
                userLocation.getCoordinatedsOnCameraMove(position);
              },
              onMapCreated: onCreated,
              onCameraIdle: () {
                userLocation.getAddressOnCameraMove();
              },
            ),
            const Center(
              child: Icon(
                Icons.location_on,
                size: 40.0,
                color: Colors.red,
              ),
            ),
            Positioned(
                bottom: 0.0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
                  color: Colors.white,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: userLocation.selectedAddress != null
                      ? Column(
                          children: [
                            Text(userLocation.selectedAddress.featureName),
                            Text(userLocation.selectedAddress.addressLine),
                          ],
                        )
                      : Column(),
                ))
          ],
        ),
      ),
    );
  }
}
