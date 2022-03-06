import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';
import 'package:ticketing_app/app/models/user_model/user_model.dart';

abstract class LoginRepository extends BaseRepository {
  Future<ApiResult<Map>> login(
      {required String userName, required String password});
}

class LoginRepositoryImp extends LoginRepository {
  @override
  Future<ApiResult<Map>> login(
      {required String userName, required String password}) async {
    final response = await postRequest(
      url: 'login.php',
      parameters: <String, String>{
        'username': userName,
        'password': password,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    if (response['message'] == 'Login Successful') {
      return ApiResult.success(data: {
        'message': response['message'],
        'data': UserModel.fromJson(response["data"])
      });
    } else {
      return ApiResult.success(data: {
        'message': response['message'],
      });
    }
  }
}
