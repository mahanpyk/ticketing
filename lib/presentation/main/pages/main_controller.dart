import 'package:get/get.dart';
import 'package:ticketing_app/app/routes/app_routes.dart';
import 'package:ticketing_app/presentation/main/repository/main_repository.dart';

class MainController extends GetxController {
  MainController(this._repository);

  final MainRepository _repository;

  @override
  void onInit() {
    super.onInit();
    getTickets();
  }

  void getTickets() async {
    final response = await _repository.getTickets();
    response.when(success: (data) {}, failure: (error) {});
  }

  void newTicket() {
    Get.toNamed(Routes.NEW_TICKET);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
