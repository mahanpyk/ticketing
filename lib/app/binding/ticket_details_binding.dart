import 'package:get/get.dart';
import 'package:ticketing_app/presentation/ticket_details/pages/ticket_details_controller.dart';
import 'package:ticketing_app/presentation/ticket_details/repository/ticket_details_repository.dart';

class TicketDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TicketDetailsController>(
        () => TicketDetailsController(Get.find<TicketDetailsRepository>()));
    Get.lazyPut<TicketDetailsRepository>(() => TicketDetailsRepositoryImp());
  }
}
