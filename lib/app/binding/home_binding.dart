import 'package:get/get.dart';
import 'package:ticketing_app/presentation/home/pages/home_controller.dart';
import 'package:ticketing_app/presentation/home/repository/home_repository.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(Get.find<HomeRepository>()));
    Get.lazyPut<HomeRepository>(() => HomeRepositoryImp());
  }
}
