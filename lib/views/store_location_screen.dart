import 'package:delete/controllers/store_location_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class OutletLocationPage extends StatelessWidget {
  final LocationController con = Get.put(LocationController());

  OutletLocationPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Outlet location"),
        backgroundColor: Colors.white,
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search for area, street name",
                prefixIcon: const Icon(Icons.search, color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
              onSubmitted: (query) => con.searchLocation(query),
            ),
          ),

          // Map Section
          Expanded(
            child: GetBuilder<LocationController>(
              builder: (controller) {
                return Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: controller.selectedLocation,
                        zoom: 15,
                      ),
                      onMapCreated: (GoogleMapController mapController) {
                        controller.mapController = mapController;
                      },
                      markers: {
                        Marker(
                          markerId: const MarkerId("selected_location"),
                          position: controller.selectedLocation,
                        ),
                      },
                      onTap: (LatLng position) {
                        controller.selectedLocation = position;
                        controller.getAddressFromLatLng();
                        controller.update();
                      },
                    ),
                    Positioned(
                      top: 10,
                      left: 30,
                      right: 30,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Your order will be delivered here",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          // Use Current Location Button
          TextButton.icon(
            onPressed: () => con.getCurrentLocation(),
            icon: const Icon(Icons.my_location, color: Colors.red),
            label: const Text(
              "Use current location",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),

          // Fetched Address Section
          GetBuilder<LocationController>(
            builder: (controller) {
              return Container(
                padding: const EdgeInsets.all(12.0),
                color: Colors.blue.shade50,
                child: Column(
                  children: [
                    const Text(
                      "You will have to verify GST based on your state",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      controller.fetchedAddress,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
              );
            },
          ),

          // Confirm Location Button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                debugPrint("Confirmed Location: ${con.selectedLocation}");
                debugPrint("Confirmed Address: ${con.fetchedAddress}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Location Confirmed: ${con.fetchedAddress}"),
                  ),
                );
              },
              child: const Text(
                "Confirm location",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
