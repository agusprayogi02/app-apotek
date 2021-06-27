import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apotek_app/controllers/home_controller.dart';
import 'components/body.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
