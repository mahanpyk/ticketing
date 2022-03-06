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
    required String fullName,
    required String replay,
  });

  Future<ApiResult<Map>> updateTickets({
    required String ticketId,
    required String unitId,
    required String userId,
    required String description,
    required String date,
    required String isRead,
    required String fullName,
  });

  Future<ApiResult<String>> getFullName({required int userId});
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
    required String fullName,
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
        'fullName': fullName,
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
    required String fullName,
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
        'fullName': fullName,
      },
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: {'message': response['message']});
  }

  @override
  Future<ApiResult<String>> getFullName({required int userId}) async {
    final response = await getRequest(
      url: 'get_user.php',
      queryParams: '?userId=$userId',
    );
    if (response == Exception()) {
      return ApiResult.failure(error: response);
    }
    return ApiResult.success(data: response['fullName']);
  }
}
