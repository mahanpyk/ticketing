import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/models/ticket_model/ticket_model.dart';
import 'package:ticketing_app/app/models/user_model/user_model.dart';
import 'package:ticketing_app/app/store/user_store_service.dart';
import 'package:ticketing_app/app/utils/dropdown_items_calculator.dart';
import 'package:ticketing_app/presentation/ticket_details/repository/ticket_details_repository.dart';

class TicketDetailsController extends GetxController {
  TicketDetailsController(this._repository);

  final TicketDetailsRepository _repository;
  TextEditingController replayController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxString dropdownTitle = '--انتخاب کنید--'.obs;
  RxString fullName = ''.obs;
  int unitId = 1;
  late TicketModel ticketModel;
  late UserModel userModel;

  @override
  onInit() {
    super.onInit();
    ticketModel = Get.arguments['ticket'];
    userModel = UserStoreService.to.getUser()!;
    dropdownTitle(dropdownStringItems(int.parse(ticketModel.unitId)));
    getFullName();
  }

  void getFullName() async {
    final response =
        await _repository.getFullName(userId: int.parse(userModel.userId));
    response.when(
        success: (data) => fullName(data),
        failure: (error) {
          Get.snackbar(
            'خطا در دریافت اطلاعات',
            'خطا در هنگام دریافت اطلاعات. لطفا مجددا تلاش کنید',
            backgroundColor: Colors.grey,
            snackPosition: SnackPosition.BOTTOM,
          );
        });
  }

  void onChangeDropdown({required String onSelected}) {
    dropdownTitle(onSelected);
    unitId = dropdownIntegerItems(onSelected);
  }

  void updateTicket({required bool replay}) async {
    if (replayController.text.length > 1 ||
        dropdownTitle.value !=
            dropdownStringItems(int.parse(ticketModel.unitId))) {
      ApiResult response;
      if (replay) {
        response = await _repository.replayTickets(
          ticketId: ticketModel.ticketId,
          unitId: replay ? ticketModel.unitId : unitId.toString(),
          userId: ticketModel.userId,
          description: ticketModel.description,
          date: ticketModel.date,
          isRead: "2",
          replay: replayController.text.toString(),
        );
      } else {
        response = await _repository.updateTickets(
          ticketId: ticketModel.ticketId,
          unitId: replay ? ticketModel.unitId : unitId.toString(),
          userId: ticketModel.userId,
          description: ticketModel.description,
          date: ticketModel.date,
          isRead: "1",
        );
      }
      response.when(success: (data) {
        if (data['message'] == 'insert data Successful' ||
            data['message'] == 'Update data Successful') {
          Get.back(result: true);
          Get.snackbar(
            'عملیات موفق',
            replay
                ? 'پاسخ شما با موفقیت ثبت شد'
                : 'تیکت با موفقیت بروزرسانی شد',
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

  dropdownValidator({required Object? input}) {
    if (input == null || input == "--انتخاب کنید--") {
      return 'انتخاب یک مورد الزامی است';
    }
    return null;
  }

  replayValidator({required String? input}) {
    if (input == null || input.isEmpty) {
      return "لطفا پاسخی را وارد کنید";
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
    replayController.clear();
    dropdownTitle.close();
  }
}
