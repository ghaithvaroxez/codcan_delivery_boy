import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fuodz/services/app.service.dart';
import 'package:fuodz/services/auth.service.dart';
import 'package:fuodz/widgets/bottomsheets/location_permission.bottomsheet.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';

class LocationService {
  //
  static Location location = new Location();
  static LocationData currentLocation;
  static bool serviceEnabled;
  static PermissionStatus _permissionGranted;
  static FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  static BehaviorSubject<bool> locationDataAvailable = BehaviorSubject<bool>();

  //
  static Future<void> prepareLocationListener() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      //
      if (await showRequestDialog()) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
    }

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    _startLocationListner();
  }

  static Future<bool> showRequestDialog() async {
    //
    var requestResult = false;
    //
    await showDialog(
      context: AppService.navigatorKey.currentContext,
      builder: (context) {
        return LocationPermissionDialog(onResult: (result) {
          requestResult = result;
        });
      },
    );

    //
    return requestResult;
  }

  static void _startLocationListner() async {
    //
    //update location every 100meters
    await location.changeSettings(distanceFilter: 100);

    //listen
    location.onLocationChanged.listen((LocationData mCurrentLocation) {
      // Use current location
      if( currentLocation  == null ){
        locationDataAvailable.add(true);
      }
      currentLocation = mCurrentLocation;
      syncLocationWithFirebase(currentLocation);
    });
  }

  //
  static syncLocationWithFirebase(LocationData currentLocation) async {
    final driverId = (await AuthServices.getCurrentUser()).id.toString();
    //
    if (AppService.driverIsOnline) {
      print("Send to fcm");
      firebaseFireStore.collection("drivers").doc(driverId).set(
        {
          "lat": currentLocation.latitude,
          "long": currentLocation.longitude,
        },
      );
    }
  }
}
