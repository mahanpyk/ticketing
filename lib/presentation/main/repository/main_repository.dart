import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';

abstract class MainRepository extends BaseRepository {
  Future<ApiResult> getTickets();
}

class MainRepositoryImp extends MainRepository {
  @override
  Future<ApiResult> getTickets() async {
    final result = await postRequest(
      url: 'login.php',
      parameters: <String, String>{
        'username': 'userName',
        'password': 'password',
      },
    );
    if (result == Exception()) {
      return ApiResult.failure(error: result);
    }
    return ApiResult.success(data: result);
  }
}
