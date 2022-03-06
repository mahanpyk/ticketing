import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_model.freezed.dart';
part 'ticket_model.g.dart';

@freezed
class TicketModel with _$TicketModel {
  const factory TicketModel({
    required String ticketId,
    required String unitId,
    required String description,
    required String userId,
    required String date,
    required String isRead,
    required String fullName,
    String? replay,
  }) = _TicketModel;

  factory TicketModel.fromJson(Map<String, dynamic> json) =>
      _$TicketModelFromJson(json);
}
