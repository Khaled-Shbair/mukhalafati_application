import '/config/all_imports.dart';

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
      date: date.onNull(),
      isRead: isRead.onNull(),
      id: this.id.onNull(),
      content: content.onNull(),
    );
  }
}
