import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';
import 'package:ticketing_app/app/store/user_store_service.dart';
import 'package:ticketing_app/presentation/login/repository/login_repository.dart';

class LoginController extends GetxController {
  LoginController(this._repository);

  final LoginRepository _repository;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool onTapLogin = false;

  void onTapButton() async {
    if (userNameController.text.length > 3 &&
        passwordController.text.length > 5) {
      final response = await _repository.login(
        userName: userNameController.text,
        password: passwordController.text,
      );
      response.when(success: (data) {
        if (data['message'] == 'Login Successful') {
          UserStoreService.to.saveUser(data['data']);
          Get.offAndToNamed(Routes.HOME);
        } else if (data['message'] == 'UserName is Empty') {
          Get.snackbar(
            'خطا در ورود اطلاعات',
            'نام کاربری وارد نشده است',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (data['message'] == 'Password is Empty') {
          Get.snackbar(
            'خطا در ورود اطلاعات',
            'کلمه عبور وارد نشده است',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else if (data['message'] == 'Login Failed') {
          Get.snackbar(
            'ورود ناموفق',
            '!هیچ کاربری با اطلاعات وارد شده یافت نشد',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'ورود ناموفق',
            'مشکل در ارتباط با سرور',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }, failure: (error) {
        Get.snackbar(
          'ورود ناموفق',
          'مشکل در ارتباط با سرور',
          backgroundColor: Colors.grey,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
      formKey.currentState?.validate();
    } else {
      onTapLogin = true;
      formKey.currentState?.validate();
    }
  }

  validation({
    required String? text,
    required String message,
    required String toShort,
    bool password = false,
  }) {
    if (text == null || text.isEmpty) return message;
    if ((onTapLogin || password) && text.length < (password ? 5 : 3)) {
      onTapLogin = false;
      return toShort;
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }
}
