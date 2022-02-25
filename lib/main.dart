import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/binding/main_binding.dart';
import 'package:ticketing_app/app/routes/app_pages.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';

void main() {
  // runApp(const MyApp());
  runApp(
    GetMaterialApp(
      title: 'تیکت',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      initialBinding: MainBinding(),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [Locale("en")],
      // fallbackLocale: const Locale("en"),
    ),
  );
}
