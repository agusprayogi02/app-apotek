import 'package:apotek_app/bindings/home_binding.dart';
import 'package:apotek_app/bindings/splash_screen_binding.dart';
import 'package:apotek_app/ui/pages/home/home_page.dart';
import 'package:apotek_app/ui/pages/splash_screen/splash_screen_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];
}
