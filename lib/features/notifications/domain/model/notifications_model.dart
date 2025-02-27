class NotificationsModel {
  List<NotificationModel> data;
   int unreadCount;

  NotificationsModel({
    required this.data,
    required this.unreadCount,
  });
}

class NotificationModel {
  final int id;
  final String content;
  final String date;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.content,
    required this.isRead,
    required this.date,
  });
}
