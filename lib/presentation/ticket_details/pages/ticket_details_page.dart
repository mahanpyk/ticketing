import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/base_view.dart';
import 'package:ticketing_app/presentation/ticket_details/pages/ticket_details_controller.dart';

class TicketDetailsPage extends BaseView {
  TicketDetailsPage({Key? key}) : super(key: key);

  final TicketDetailsController _controller =
      Get.find<TicketDetailsController>();

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.userModel.userId == "1"
                  ? Obx(() {
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
                    })
                  : Column(
                      children: [
                        const Text(
                          'عنوان:',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          _controller.dropdownTitle.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
              const SizedBox(height: 24),
              const Text(
                "توضیحات:",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                _controller.ticketModel.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
        if (_controller.userModel.userId == "8" ||
            _controller.userModel.userId != "1")
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromRGBO(66, 63, 62, 1),
            ),
            child: Column(
              children: [
                if (_controller.userModel.userId == "8")
                  Column(
                    children: const [
                      Text(
                        'پاسخ:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                Form(
                  key: _controller.formKey,
                  child: TextFormField(
                    controller: _controller.replayController,
                    decoration: const InputDecoration(
                      labelText: "پاسخ",
                      labelStyle: TextStyle(color: Colors.white),
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
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const Text("تیک", style: TextStyle(color: Colors.white)),
      backgroundColor: const Color.fromRGBO(66, 63, 62, 1),
    );
  }

  @override
  Widget? floatingActionButton() {
    if (_controller.userModel.userId == "8") {
      return null;
    } else {
      return FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(
            _controller.userModel.userId == "1" ? Icons.edit : Icons.check),
        onPressed: () => _controller.userModel.userId == "1"
            ? _controller.updateTicket(replay: false)
            : _controller.updateTicket(replay: true),
      );
    }
  }
}
