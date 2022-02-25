import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/presentation/main/pages/main_controller.dart';

class MainPage extends BaseView {
  MainPage({Key? key}) : super(key: key);

  final MainController _controller = Get.find<MainController>();

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(
          // itemCount: ,
          itemBuilder: (context, index) {
            return Container();
          },
        ))
      ],
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("تیک ها", style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromRGBO(66, 63, 62, 100),
    );
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      onPressed: () => _controller.newTicket(),
    );
  }

  @override
  Color pageBackgroundColor() => const Color.fromRGBO(0, 0, 0, 100);
}
