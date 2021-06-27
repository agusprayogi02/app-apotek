import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late GoogleMapController mapController;
  final initCameraMap = CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 100,
  );

  @override
  void onInit() async {
    await getCurrentPos();
    super.onInit();
  }

  getCurrentPos() async {
    var curPos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            curPos.latitude,
            curPos.longitude,
          ),
          zoom: 100,
        ),
      ),
    );
  }
}
