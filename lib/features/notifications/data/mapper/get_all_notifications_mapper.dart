import '/config/all_imports.dart';
import 'package:get_time_ago/get_time_ago.dart';

extension GetAllNotificationsMapper on NotificationsResponse {
  toDomain() {
    return NotificationsModel(
      unreadCount: unreadCount.onNull(),
      data: data?.map<NotificationModel>((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension NotificationMapper on NotificationResponse {
  toDomain() {

    return NotificationModel(
      timeAge: GetTimeAgo.parse(
          timeSend != null ? DateTime.parse(timeSend!) : DateTime.now(),
          locale: 'ar'),
      isRead: isRead.onNull(),
      id: this.id.onNull(),
      content: content.onNull(),
    );
  }
}
