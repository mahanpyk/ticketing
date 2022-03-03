import 'package:get/get.dart';
import 'package:ticketing_app/app/binding/home_binding.dart';
import 'package:ticketing_app/app/binding/login_binding.dart';
import 'package:ticketing_app/app/binding/new_ticket_binding.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';
import 'package:ticketing_app/presentation/home/pages/home_page.dart';
import 'package:ticketing_app/presentation/login/pages/login_page.dart';
import 'package:ticketing_app/presentation/new_ticket/pages/new_ticket_page.dart';
import 'package:ticketing_app/presentation/splash/pages/splash/splash_page.dart';

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
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.NEW_TICKET,
      page: () => NewTicketPage(),
      binding: NewTicketBinding(),
    ),
  ];
}
