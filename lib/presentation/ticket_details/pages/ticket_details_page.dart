import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/app/theme/app_colors.dart';
import 'package:ticketing_app/app/utils/dropdown_items_calculator.dart';
import 'package:ticketing_app/presentation/ticket_details/pages/ticket_details_controller.dart';

class TicketDetailsPage extends BaseView {
  TicketDetailsPage({Key? key}) : super(key: key);

  final TicketDetailsController _controller =
      Get.find<TicketDetailsController>();

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: Get.width,
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
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'تاریخ درخواست:',
                    style: Get.theme.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _controller.ticketModel.date,
                    style: Get.theme.textTheme.bodyText2,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'نام و نام خانوادگی:',
                    style: Get.theme.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _controller.ticketModel.fullName,
                    style: Get.theme.textTheme.bodyText2,
                  ),
                  const SizedBox(height: 24),
                  _controller.userModel!.userId == "1" &&
                          _controller.ticketModel.replay == null
                      ? DropdownButtonFormField(
                          value: _controller.dropdownTitle.value,
                          items: dropdownItems.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: Get.theme.textTheme.bodyText1,
                              ),
                            );
                          }).toList(),
                          style: Get.theme.textTheme.bodyText1,
                          dropdownColor: AppColors.surfaceDark,
                          validator: (value) =>
                              _controller.dropdownValidator(input: value),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) => _controller.onChangeDropdown(
                              onSelected: value!.toString()),
                          iconDisabledColor: Colors.white,
                        )
                      : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'عنوان:',
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _controller.dropdownTitle.value,
                              style: Get.theme.textTheme.bodyText2,
                            ),
                          ],
                        ),
                  const SizedBox(height: 24),
                  Text(
                    "توضیحات:",
                    style: Get.theme.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _controller.ticketModel.description,
                    style: Get.theme.textTheme.bodyText2,
                  ),
                  const SizedBox(height: 8),
                ],
              );
            }),
          ),
          if (_controller.ticketModel.replay != null ||
              _controller.userModel!.unitId != "1")
            Container(
              width: Get.width,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (_controller.userModel!.unitId == "8" &&
                              _controller.ticketModel.replay != null) ||
                          (_controller.userModel!.unitId != "8" &&
                              _controller.ticketModel.replay != null)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'پاسخ:',
                              style: Get.theme.textTheme.bodyText1,
                            ),
                            const SizedBox(height: 8),
                            Text(_controller.ticketModel.replay ?? "",
                                style: Get.theme.textTheme.bodyText2),
                          ],
                        )
                      : _controller.userModel!.unitId == "8" &&
                              _controller.ticketModel.replay == null
                          ? Text(
                    'هیچ پاسخی هنوز از سمت کارشناس مربوطه ثبت نشده است!!',
                              style: Get.theme.textTheme.bodyText1,
                            )
                          : Form(
                              key: _controller.formKey,
                              child: TextFormField(
                                style: Get.theme.textTheme.bodyText1,
                                controller: _controller.replayController,
                                decoration: InputDecoration(
                                  labelText: "پاسخ",
                                  labelStyle: Get.theme.textTheme.bodyText1!
                                      .copyWith(
                                          color: AppColors.subTitleTextColor),
                                ),
                                validator: (value) =>
                                    _controller.replayValidator(input: value),
                                minLines: 1,
                                maxLines: 8,
                              ),
                            ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "تیک",
        style: Get.theme.textTheme.headline6,
      ),
      backgroundColor: AppColors.surfaceDark,
    );
  }

  @override
  Widget? floatingActionButton() {
    if (_controller.userModel!.unitId == "8" ||
        _controller.ticketModel.isRead == '2') {
      return null;
    } else {
      return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
              _controller.userModel!.userId == "1" ? Icons.edit : Icons.check),
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
        onPressed: () => _controller.userModel!.userId == "1"
            ? _controller.updateTicket(replay: false)
            : _controller.updateTicket(replay: true),
      );
    }
  }

  @override
  bool resizeToAvoidBottomInset() {
    return true;
  }
}
