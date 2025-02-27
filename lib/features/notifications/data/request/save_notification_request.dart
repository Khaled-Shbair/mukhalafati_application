class SaveNotificationRequest {
  int? driverId;
  String? title;
  String? content;
  String? timeSend;
  String? dateSend;

  SaveNotificationRequest({
    required this.dateSend,
    required this.content,
    required this.title,
    required this.driverId,
    required this.timeSend,
  });
}
