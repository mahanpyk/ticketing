import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:ticketing_app/app/models/user_model/user_model.dart';
import 'package:ticketing_app/app/store/user_store_service.dart';
import 'package:ticketing_app/app/utils/dropdown_items_calculator.dart';
import 'package:ticketing_app/presentation/new_ticket/repository/new_ticket_repository.dart';

class NewTicketController extends GetxController {
  NewTicketController(this._repository);

  final NewTicketRepository _repository;
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int unitId = 1;
  RxString dropdownTitle = '--انتخاب کنید--'.obs;
  UserModel? userModel = UserStoreService.to.getUser();

  String calcDate() {
    Date date = Jalali.fromDateTime(DateTime.now());
    date.formatter;
    return '${date.year}/${date.month}/${date.day}';
  }

  void onChangeDropdown({required String onSelected}) {
    dropdownTitle(onSelected);
    unitId = dropdownIntegerItems(onSelected);
  }

  void newTicket() async {
    if (descriptionController.text.length > 10 && unitId != 1) {
      final response = await _repository.postNewTickets(
        unitId: unitId.toString(),
        userId: userModel!.userId,
        description: descriptionController.text,
        date: calcDate(),
        isRead: "1",
        fullName: "1",
      );
      response.when(success: (data) {
        if (data['message'] == 'insert data Successful') {
          Get.back(result: true);
          Get.snackbar(
            'عملیات موفق',
            'تیکت شما با موفقیت ثبت شد',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            'عملیات ناموفق',
            'خطا در هنگام ثبت تیکت. لطفا اطلاعات ورودی را چک کنید و مجددا تلاش کنید',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }, failure: (error) {
        Get.snackbar(
          'عملیات ناموفق',
          'خطا در هنگام ثبت تیکت. لطفا اطلاعات ورودی را چک کنید و مجددا تلاش کنید',
          backgroundColor: Colors.grey,
          snackPosition: SnackPosition.BOTTOM,
        );
      });
    } else {
      formKey.currentState?.validate();
    }
  }

  String? validation(
      {required String? text,
      required String message,
      required String toShort}) {
    if (text == null || text.isEmpty) return message;
    if (text.length < 10) return toShort;
    return null;
  }

  dropdownValidator({required Object? input}) {
    if (input == null || input == "--انتخاب کنید--") {
      return 'انتخاب یک مورد الزامی است';
    }
    return null;
  }

  @override
  void dispose() {
    descriptionController.dispose();
    dropdownTitle.close();
    super.dispose();
  }
}
