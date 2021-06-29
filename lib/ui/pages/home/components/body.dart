import 'package:apotek_app/controllers/home_controller.dart';
import 'package:apotek_app/ui/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../components/input_outline.dart';

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
            polylines: Set<Polyline>.of(controller.polylines.values),
            onLongPress: (langlng) {
              controller.selectLoc(langlng);
              var pos = controller.currentPos;
              print("ada $pos");
              print("ada $langlng");
              controller.createPolylines(
                pos.latitude,
                pos.longitude,
                langlng.latitude,
                langlng.longitude,
              );
            },
          ),
          Positioned(
            top: 25,
            left: 25,
            right: 25,
            child: Container(
              alignment: Alignment.center,
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8.0)),
              padding: SizeUtils.paddingAll(),
              child: Column(
                children: [
                  InputOutline(
                    controller: controller.currentAddrCtrl,
                    hint: "Lokasi Sekarang",
                    icon: Icons.place_rounded,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InputOutline(
                    controller: controller.tujuanCtrl,
                    hint: "Apotek",
                    icon: Icons.find_replace,
                  ),
                  if (controller.jarak() != 0)
                    "Jarak ${controller.jarak()}".text.make(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
