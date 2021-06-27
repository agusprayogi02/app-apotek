import 'package:apotek_app/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Body extends GetView<HomeController> {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: controller.initCameraMap,
            mapType: MapType.normal,
            onMapCreated: (ctlr) => controller.mapController = ctlr,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
        ],
      ),
    );
  }
}
