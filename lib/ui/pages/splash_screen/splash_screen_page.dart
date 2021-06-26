import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/splash_screen_controller.dart';

class SplashScreenPage extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashScreenPage'),
      ),
      body: SafeArea(
        child: Text('SplashScreenController'),
      ),
    );
  }
}
