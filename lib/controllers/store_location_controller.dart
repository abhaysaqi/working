import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
class LocationController extends GetxController {
  LatLng selectedLocation =
      const LatLng(31.3260, 75.5762); // Default location (Jalandhar)
  String fetchedAddress = "Guru Sant Nagar, Jalandhar";

  GoogleMapController? mapController;

  // Fetch current location
  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    selectedLocation = LatLng(position.latitude, position.longitude);
    await getAddressFromLatLng();
    update(); // Update GetBuilder
    mapController?.animateCamera(CameraUpdate.newLatLng(selectedLocation));
  }

  // Get address from coordinates
  Future<void> getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          selectedLocation.latitude, selectedLocation.longitude);
      Placemark place = placemarks[0];
      fetchedAddress =
          "${place.street}, ${place.locality}, ${place.administrativeArea}";
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Search location
  Future<void> searchLocation(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        selectedLocation = LatLng(location.latitude, location.longitude);
        await getAddressFromLatLng();
        update(); // Update GetBuilder
        mapController?.animateCamera(CameraUpdate.newLatLng(selectedLocation));
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
