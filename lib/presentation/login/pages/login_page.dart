import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/presentation/login/pages/login_controller.dart';

class LoginPage extends BaseView {
  LoginPage({Key? key}) : super(key: key);

  final LoginController _controller = Get.find<LoginController>();

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color.fromRGBO(66, 63, 62, 100),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              Form(
                key: _controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _controller.userNameController,
                      decoration: const InputDecoration(
                        labelText: "نام کاربری",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) => _controller.validation(
                          text: value,
                          message: "لطفا نام کاربری خود را وارد کنید",
                          toShort: "نام کاربری وارد شده کوتاه است"),
                      onChanged: (value) =>
                          _controller.formKey.currentState?.validate(),
                      // onChanged: (value) =>
                      //     _controller.formKey.currentState?.validate(),
                    ),
                    TextFormField(
                      controller: _controller.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "کلمه عبور",
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      validator: (value) => _controller.validation(
                          text: value,
                          message: "لطفا کلمه عبور خود را وارد کنید",
                          toShort: "کلمه عبور وارد شده کوتاه است"),
                      onChanged: (value) =>
                          _controller.formKey.currentState?.validate(),
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
                    child: ElevatedButton(
                      onPressed: () => _controller.onTapButton(),
                      child: const Text(
                        'ورود',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
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
      title: const Text("ورود", style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromRGBO(66, 63, 62, 100),
    );
  }

  @override
  Color pageBackgroundColor() => const Color.fromRGBO(0, 0, 0, 100);
}
