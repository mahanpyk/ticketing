import 'package:get/get.dart';
import 'package:ticketing_app/app/models/ticket_model/ticket_model.dart';
import 'package:ticketing_app/app/models/user_model/user_model.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';
import 'package:ticketing_app/app/store/user_store_service.dart';
import 'package:ticketing_app/presentation/home/repository/home_repository.dart';

class HomeController extends GetxController {
  HomeController(this._repository);

  final HomeRepository _repository;
  final UserModel? userModel = UserStoreService.to.getUser();
  final RxList ticketsReadList = [].obs;
  var noResult = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTickets();
  }

  void getTickets() async {
    final response = await _repository.getTickets(
      unitId: userModel!.unitId,
      userId: userModel!.userId,
    );
    response.when(
        success: (data) {
          if (data['unReadList'].isEmpty && data['readList'].isEmpty) {
            noResult(true);
          } else {
            noResult(false);
            ticketsReadList.clear();
            ticketsReadList.add('--- تیکت های پاسخ داده شده ---');
            ticketsReadList.addAll(data['readList']);
            ticketsReadList.add('--- تیکت های بدون پاسخ ---');
            ticketsReadList.addAll(data['unReadList']);
          }
        },
        failure: (error) {});
  }

  void newTicket() async {
    var result = await Get.toNamed(Routes.NEW_TICKET);
    if (result != null && result) {
      getTickets();
    }
  }

  void onTapTicket({required TicketModel item}) async {
    var result =
        await Get.toNamed(Routes.TICKET_DETAILS, arguments: {'ticket': item});
    if (result != null && result) {
      getTickets();
    }
  }

  @override
  void dispose() {
    super.dispose();
    ticketsReadList.close();
  }
}
