import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';

abstract class HomeRepository extends BaseRepository {
  Future<ApiResult> getTickets();
}

class HomeRepositoryImp extends HomeRepository {
  @override
  Future<ApiResult> getTickets() async {
    final result = await postRequest(
      url: 'home.php',
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
