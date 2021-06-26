import 'package:apotek_app/bindings/splash_screen_binding.dart';
import 'package:apotek_app/routes/app_pages.dart';
import 'package:apotek_app/ui/pages/splash_screen/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Toko Apotek",
      debugShowCheckedModeBanner: false,
      initialBinding: SplashScreenBinding(),
      initialRoute: Routes.INITIAL,
      getPages: AppPages.pages,
      home: SplashScreenPage(),
    );
  }
}
