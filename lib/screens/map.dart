import 'package:eorganic/provider/location_provider.dart';
import 'package:eorganic/provider/user_auth_provider.dart';
import 'package:eorganic/routes/my_routes.dart';
import 'package:eorganic/widgets/my_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? currentLocation;
  GoogleMapController? _mapController;
  bool? locating = false;
  bool? _logedIn = false;
  User? user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });

    if (user != null) {
      setState(() {
        _logedIn = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userLocation = Provider.of<LocationProvider>(context);
    final userAuth = Provider.of<UserAuthProvider>(context);

    setState(() {
      currentLocation = LatLng(userLocation.latitude!, userLocation.longitude!);
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        _mapController = controller;
      });
    }

    return Scaffold(
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        color: Colors.white,
        height: 150,
        width: MediaQuery.of(context).size.width,
        child: userLocation.selectedAddress != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  locating!
                      ? LinearProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).backgroundColor),
                        )
                      : Container(),
                  Flexible(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        userLocation.selectedAddress.featureName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: MyTheme.green,
                            fontSize: 21),
                      ),
                    ),
                  ),
                  //  Text(userLocation.selectedAddress.featureName),
                  Text(
                    userLocation.selectedAddress.addressLine,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: MyTheme.dark),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: locating!
                            ? MyTheme.dark
                            : MyTheme.green, // background
                        onPrimary: Colors.white, // foreground
                      ),
                      onPressed: () {
                        //  userAuth.screen="MapScreen";
                        if (_logedIn == false) {
                          Navigator.pushNamed(
                              context, MyRoutes.loginScreenRoute);
                        } else {
                          setState(() {
                            userAuth.latitude = userLocation.latitude;
                            userAuth.longitude = userLocation.longitude;
                            userAuth.address =
                                userLocation.selectedAddress.addressLine;
                          });
                          userAuth
                              .updateUser(
                            id: user!.uid,
                            number: user!.phoneNumber,
                          )
                              .then((value) {
                            if (value == true) {
                              Navigator.pushNamed(
                                  context, MyRoutes.homeScreenRoute);
                            }
                          });
                        }
                      },
                      child: const Text(
                        'Conform your location',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                      ))
                ],
              )
            : Column(),
      ),
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
                setState(() {
                  locating = true;
                });
              },
              onMapCreated: onCreated,
              onCameraIdle: () {
                userLocation.getAddressOnCameraMove();
                setState(() {
                  locating = false;
                });
              },
            ),
            Center(
              child: Icon(
                Icons.location_on,
                size: 40.0,
                color: Colors.red.shade800,
              ),
            ),
            Center(
                child: SpinKitPulse(
              color: Colors.red.shade500,
              size: 80.0,
            ))
          ],
        ),
      ),
    );
  }
}
