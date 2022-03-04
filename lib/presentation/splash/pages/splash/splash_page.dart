import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';

class SplashPage extends BaseView {
  SplashPage({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAndToNamed(Routes.LOGIN);
      },
    );
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/icons/logo.png",
            width: 150,
          ),
          const SizedBox(height: 8),
          const Text(
            "Ticketing",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 48),
          const CircularProgressIndicator(
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  @override
  bool safeArea() => false;
}
