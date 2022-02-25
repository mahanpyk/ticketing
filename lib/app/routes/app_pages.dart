import 'package:get/get.dart';
import 'package:ticketing_app/app/binding/login_binding.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';
import 'package:ticketing_app/presentation/login/pages/login_page.dart';
import 'package:ticketing_app/presentation/main/pages/main_page.dart';
import 'package:ticketing_app/presentation/splash/pages/splash/splash_page.dart';

import '../binding/main_binding.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.NEW_TICKET,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
  ];
}
