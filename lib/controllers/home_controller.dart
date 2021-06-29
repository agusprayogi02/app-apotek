import 'package:apotek_app/ui/utils/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late GoogleMapController mapController;
  final currentAddrCtrl = TextEditingController();
  final tujuanCtrl = TextEditingController();
  final placeMark = <Placemark>[].obs;
  final jarak = 0.obs;
  late Position currentPos;
  final initCameraMap = CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 150,
  );
  final Map<PolylineId, Polyline> polylines = {};
  final selectLoc = LatLng(0.0, 0.0).obs;

  @override
  void onInit() async {
    await getCurrentPos();
    super.onInit();
  }

  getCurrentPos() async {
    currentPos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            currentPos.latitude,
            currentPos.longitude,
          ),
          zoom: 150,
        ),
      ),
    );
    await _getAlamat();
  }

  _getAlamat() async {
    try {
      var alamat = await placemarkFromCoordinates(
          currentPos.latitude, currentPos.longitude);
      Placemark place = alamat.first;
      var addr =
          "${place.name} ${place.locality} ${place.postalCode} ${place.country}";
      currentAddrCtrl.text = addr;
    } catch (e) {
      print(e);
    }
  }

  createPolylines(
    double startLat,
    double startLong,
    double endLat,
    double endLong,
  ) async {
    var polylinePoints = PolylinePoints();
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      EnvUtils.googleAPIKey,
      PointLatLng(startLat, startLong),
      PointLatLng(endLat, endLong),
      travelMode: TravelMode.transit,
    );
    print("ada ${result.errorMessage}");
    if (result.points.isNotEmpty) {
      result.points.forEach((coord) {
        polylineCoordinates.add(LatLng(coord.latitude, coord.longitude));
      });
    }

    PolylineId id = PolylineId("poly1");
    var polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }
}
