import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/presentation/home/pages/home_controller.dart';

class HomePage extends BaseView {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      if (_controller.ticketsList.isNotEmpty) {
        return Expanded(
          child: ListView.builder(
            itemCount: _controller.ticketsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: _controller.ticketsList[index].description,
                subtitle: _controller.ticketsList[index].description,
              );
            },
          ),
        );
      } else {
        return Center(
          child: _controller.noResult.value
              ? Image.asset(
                  "assets/images/no_result_found.png",
                  width: 350,
                )
              : const CircularProgressIndicator(),
        );
      }
    });
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
      backgroundColor: const Color.fromRGBO(66, 63, 62, 100),
      child: const Icon(Icons.add),
      onPressed: () => _controller.newTicket(),
    );
  }

  @override
  Color pageBackgroundColor() => const Color.fromRGBO(0, 0, 0, 100);
}
