import 'package:get/get.dart';
import 'package:ticketing_app/presentation/login/pages/login_controller.dart';
import 'package:ticketing_app/presentation/login/repository/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
            () => LoginController(Get.find<LoginRepository>()));
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImp());
  }
}
