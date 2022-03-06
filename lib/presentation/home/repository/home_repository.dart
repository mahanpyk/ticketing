import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';
import 'package:ticketing_app/app/models/ticket_model/ticket_model.dart';

abstract class HomeRepository extends BaseRepository {
  Future<ApiResult<Map>> getTickets(
      {required String unitId, required String userId});
}

class HomeRepositoryImp extends HomeRepository {
  @override
  Future<ApiResult<Map>> getTickets(
      {required String unitId, required String userId}) async {
    final response = await getRequest(
      url: 'home.php',
      queryParams: '?unitId=$unitId&userId=$userId',
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    final List<TicketModel> readList = [];
    final List<TicketModel> unReadList = [];
    for (var item in response['readList']) {
      readList.add(TicketModel.fromJson(item));
    }
    for (var item in response['unReadList']) {
      unReadList.add(TicketModel.fromJson(item));
    }
    return ApiResult.success(
        data: {'readList': readList, 'unReadList': unReadList});
  }
}
