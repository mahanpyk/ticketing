import 'package:get/get.dart';
import 'package:ticketing_app/app/services/storege_service.dart';
import 'package:ticketing_app/app/store/user_store_service.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalStorage>(() => StorageService());

    Get.put<UserStoreService>(UserStoreService(Get.find<LocalStorage>()),
        permanent: true);
  }
}
