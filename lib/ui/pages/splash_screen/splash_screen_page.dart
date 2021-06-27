import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
