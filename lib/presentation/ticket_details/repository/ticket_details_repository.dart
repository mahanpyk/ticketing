import 'package:ticketing_app/app/base/api_result.dart';
import 'package:ticketing_app/app/base/base_repository.dart';

abstract class TicketDetailsRepository extends BaseRepository {
  Future<ApiResult<Map>> replayTickets({
    required String ticketId,
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
    required String replay,
  });

  Future<ApiResult<Map>> updateTickets({
    required String ticketId,
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
  });
}

class TicketDetailsRepositoryImp extends TicketDetailsRepository {
  @override
  Future<ApiResult<Map>> replayTickets({
    required String ticketId,
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
    required String replay,
  }) async {
    final response = await postRequest(
      url: 'update_ticket.php',
      parameters: <String, String>{
        'ticketId': ticketId,
        'unitId': unitId,
        'description': description,
        'userId': userId,
        'date': date,
        'isRead': isRead,
        'replay': replay,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: {'message': response['message']});
  }

  @override
  Future<ApiResult<Map>> updateTickets({
    required String ticketId,
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
  }) async {
    final response = await postRequest(
      url: 'update_ticket.php',
      parameters: <String, String>{
        'ticketId': ticketId,
        'unitId': unitId,
        'description': description,
        'userId': userId,
        'date': date,
        'isRead': isRead,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: {'message': response['message']});
  }
}
