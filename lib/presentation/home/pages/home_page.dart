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
      if (_controller.ticketsReadList.isNotEmpty) {
        return Column(
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListView.builder(
                  itemCount: _controller.ticketsReadList.length,
                  itemBuilder: (context, index) {
                    if (_controller.ticketsReadList[index] is String) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          _controller.ticketsReadList[index],
                          style: Get.theme.textTheme.headline5,
                        )),
                      );
                    } else {
                      return Card(
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
                                _controller.ticketsReadList[index].unitId)),
                            style: Get.theme.textTheme.bodyText1,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            _controller.ticketsReadList[index].description,
                            style: Get.theme.textTheme.caption!
                                .copyWith(color: AppColors.subTitleTextColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: Text(
                            _controller.ticketsReadList[index].date,
                            style: Get.theme.textTheme.overline,
                          ),
                          onTap: () => _controller.onTapTicket(
                              item: _controller.ticketsReadList[index]),
                        ),
                      );
                    }
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
      title: Text(
        "تیک ها",
        style: Get.theme.textTheme.headline6,
      ),
      backgroundColor: AppColors.surfaceDark,
    );
  }

  @override
  Widget? floatingActionButton() {
    if (_controller.userModel!.unitId != '8') {
      return null;
    } else {
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
            ),
          ),
        ),
        onPressed: () => _controller.newTicket(),
      );
    }
  }
}
