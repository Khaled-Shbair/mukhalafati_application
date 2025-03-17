class SaveNotificationRequest {
  int? driverId;
  String? title;
  String? content;
  String? timeSend;

  SaveNotificationRequest({
    required this.content,
    required this.title,
    required this.driverId,
    required this.timeSend,
  });
}
