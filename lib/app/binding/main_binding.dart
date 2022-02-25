import 'package:get/get.dart';
import 'package:ticketing_app/presentation/main/pages/main_controller.dart';
import 'package:ticketing_app/presentation/main/repository/main_repository.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
            () => MainController(Get.find<MainRepository>()));
    Get.lazyPut<MainRepository>(() => MainRepositoryImp());
  }
}
