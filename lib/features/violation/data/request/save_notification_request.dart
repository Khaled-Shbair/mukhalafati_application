class SaveNotificationRequest  {
  int? driverId;
  String? title;
  String? content;
  String? timeSend;
  String? dateSend;

  SaveNotificationRequest({
    required this.timeSend,
    required this.driverId,
    required this.title,
    required this.content,
    required this.dateSend,
  });
}
