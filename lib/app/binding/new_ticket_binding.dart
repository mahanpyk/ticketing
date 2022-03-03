import 'package:get/get.dart';
import 'package:ticketing_app/presentation/new_ticket/pages/new_ticket_controller.dart';
import 'package:ticketing_app/presentation/new_ticket/repository/new_ticket_repository.dart';

class NewTicketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewTicketController>(
        () => NewTicketController(Get.find<NewTicketRepository>()));
    Get.lazyPut<NewTicketRepository>(() => NewTicketRepositoryImp());
  }
}
