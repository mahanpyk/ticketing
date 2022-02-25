import 'dart:async';

import 'package:get/get.dart';
import 'package:ticketing_app/app/models/user_model/user_model.dart';
import 'package:ticketing_app/app/services/storege_service.dart';

class UserStoreService extends GetxController {
  UserStoreService(this._storage);

  final LocalStorage _storage;

  static const user = 'USER';

  static UserStoreService get to => Get.find();

  Future<void> saveUser(UserModel userModel) async {
    await _storage.write(user, userModel);
  }

  UserModel? getUser() {
    var result = _storage.read(user);
    if (result == null) {
      return null;
    }
    return UserModel.fromJson(result);
  }
}
