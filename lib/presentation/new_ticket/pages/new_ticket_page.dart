import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/app/theme/app_colors.dart';
import 'package:ticketing_app/app/utils/dropdown_items_calculator.dart';
import 'package:ticketing_app/presentation/new_ticket/pages/new_ticket_controller.dart';

class NewTicketPage extends BaseView {
  NewTicketPage({Key? key}) : super(key: key);

  final NewTicketController _controller = Get.find<NewTicketController>();

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
                    Obx(() {
                      return DropdownButtonFormField(
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
                      );
                    }),
                    TextFormField(
                      style: Get.theme.textTheme.bodyText1,
                      controller: _controller.descriptionController,
                      decoration: InputDecoration(
                        labelText: "توضیحات",
                        labelStyle: Get.theme.textTheme.bodyText1!
                            .copyWith(color: AppColors.subTitleTextColor),
                      ),
                      validator: (value) => _controller.validation(
                        text: value,
                        message: "لطفا توضیحات خود را وارد کنید",
                        toShort: "توضیحات وارد شده کوتاه است",
                      ),
                      minLines: 3,
                      maxLines: 8,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
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
        "تیک جدید",
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
        backgroundColor: Colors.red,
        child: Container(
          width: 60,
          height: 60,
          child: const Icon(Icons.check),
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
