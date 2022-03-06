import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';

abstract class NewTicketRepository extends BaseRepository {
  Future<ApiResult<Map>> postNewTickets({
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
    required String fullName,
  });
}

class NewTicketRepositoryImp extends NewTicketRepository {
  @override
  Future<ApiResult<Map>> postNewTickets({
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
    required String fullName,
  }) async {
    final response = await postRequest(url: 'new_ticket.php', parameters: {
      'unitId': unitId,
      'description': description,
      'userId': userId,
      'date': date,
      'isRead': isRead,
      'fullName': fullName,
    });
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: {'message': response['message']});
  }
}
