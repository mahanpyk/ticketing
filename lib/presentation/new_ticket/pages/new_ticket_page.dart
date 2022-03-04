import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
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
            color: const Color.fromRGBO(66, 63, 62, 1),
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
                        items: <String>[
                          "--انتخاب کنید--",
                          "سراسري",
                          "كارداني فني و حرفه اي",
                          "كارداني به كارشناسي",
                          "دانشگاه جامع علمي و كاربردي (كارداني/كارشناسي)",
                          "كارشناسي ارشد",
                          "دكتري"
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: const Color.fromRGBO(66, 63, 62, 1),
                        validator: (value) =>
                            _controller.dropdownValidator(input: value),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => _controller.onChangeDropdown(
                            onSelected: value!.toString()),
                        iconDisabledColor: Colors.white,
                      );
                    }),
                    TextFormField(
                      controller: _controller.descriptionController,
                      decoration: const InputDecoration(
                        labelText: "توضیحات",
                        labelStyle: TextStyle(color: Colors.white),
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
      title: const Text("تیک جدید", style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromRGBO(66, 63, 62, 1),
    );
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.red,
      child: const Icon(Icons.check),
      onPressed: () => _controller.newTicket(),
    );
  }

}
