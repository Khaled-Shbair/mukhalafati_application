import '/config/all_imports.dart';

part 'notifications_response.g.dart';

@JsonSerializable()
class NotificationsResponse {
  @JsonKey(name: ApiKeys.data)
  List<NotificationResponse>? data;
  @JsonKey(name: ApiKeys.unreadCount)
  int? unreadCount;

  NotificationsResponse({
    required this.data,
    required this.unreadCount,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationsResponseToJson(this);
}

@JsonSerializable()
class NotificationResponse {
  @JsonKey(name: ApiKeys.id)
  int? id;
  @JsonKey(name: ApiKeys.content)
  String? content;
  @JsonKey(name: ApiKeys.dateSend)
  String? date;
  @JsonKey(name: ApiKeys.isRead)
  bool? isRead;

  NotificationResponse({
    required this.id,
    required this.content,
    required this.date,
    required this.isRead,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
