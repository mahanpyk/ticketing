import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/app/theme/app_colors.dart';
import 'package:ticketing_app/presentation/login/pages/login_controller.dart';

class LoginPage extends BaseView {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controller = Get.find<LoginController>();

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.surfaceDark,
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                spreadRadius: 0,
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
                offset: Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: Get.theme.textTheme.bodyText1,
                      controller: _controller.userNameController,
                      decoration: InputDecoration(
                        labelText: "نام کاربری",
                        labelStyle: Get.theme.textTheme.bodyText1!
                            .copyWith(color: AppColors.subTitleTextColor),
                      ),
                      validator: (value) => _controller.validation(
                        text: value,
                        message: "لطفا نام کاربری خود را وارد کنید",
                        toShort: "نام کاربری وارد شده کوتاه است",
                      ),
                    ),
                    TextFormField(
                      style: Get.theme.textTheme.bodyText1,
                      controller: _controller.passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "کلمه عبور",
                        labelStyle: Get.theme.textTheme.bodyText1!
                            .copyWith(color: AppColors.subTitleTextColor),
                      ),
                      validator: (value) => _controller.validation(
                        text: value,
                        message: "لطفا کلمه عبور خود را وارد کنید",
                        toShort: "کلمه عبور وارد شده کوتاه است",
                        password: true,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => _controller.onTapButton(),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            'ورود',
                            style: Get.theme.textTheme.caption,
                          ),
                        ),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(32)),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            stops: [0.0, 0.5],
                            end: Alignment.bottomLeft,
                            colors: [
                              AppColors.buttonFirstColor,
                              AppColors.buttonSecondColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "ورود",
        style: Get.theme.textTheme.headline6,
      ),
      backgroundColor: AppColors.surfaceDark,
    );
  }
}
