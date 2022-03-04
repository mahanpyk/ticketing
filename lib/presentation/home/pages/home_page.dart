import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/app/theme/app_colors.dart';
import 'package:ticketing_app/app/utils/dropdown_items_calculator.dart';
import 'package:ticketing_app/presentation/home/pages/home_controller.dart';

class HomePage extends BaseView {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      if (_controller.ticketsList.isNotEmpty) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListView.builder(
                  itemCount: _controller.ticketsList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          color: AppColors.surfaceDark,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            tileColor: AppColors.surfaceDark,
                            textColor: Colors.white,
                            title: Text(
                              dropdownStringItems(int.parse(
                                  _controller.ticketsList[index].unitId)),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              _controller.ticketsList[index].description,
                              style: const TextStyle(color: Colors.white70),
                            ),
                            trailing: Text(
                              _controller.ticketsList[index].date,
                              style: const TextStyle(fontSize: 10),
                            ),
                            onTap: () => _controller.onTapTicket(
                                item: _controller.ticketsList[index]),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
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
      backgroundColor: AppColors.surfaceDark,
    );
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.buttonFirstColor,
      child: Container(
        width: 60,
        height: 60,
        child: const Icon(Icons.add),
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              radius: 1,
              center: Alignment(-0.1, -0.6),
              colors: [
                AppColors.buttonFirstColor,
                AppColors.buttonSecondColor,
              ],
            )),
      ),
      onPressed: () => _controller.newTicket(),
    );
  }
}
