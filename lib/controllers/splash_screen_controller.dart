import 'package:apotek_app/routes/app_pages.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get to => Get.find();

  @override
  void onInit() async {
    super.onInit();
    await checkPermission();
    await loading();
  }

  checkPermission() async {
    var gpsIsON = await Geolocator.isLocationServiceEnabled();
    if (!gpsIsON) {
      await Geolocator.openLocationSettings();
    }
    var permission = await Geolocator.checkPermission();
    do {
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      } else if (permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          permission = LocationPermission.denied;
        }
      }
    } while (permission == LocationPermission.denied);
  }

  loading() {
    return Future.delayed(
      Duration(seconds: 3),
      () => Get.offNamed(Routes.HOME),
    );
  }
}
