import '/config/all_imports.dart';

class NotificationModel {
  late int notificationId;
  late int driverId;
  late String notificationText;
  late String notificationTime;
  late Color? boxColor;
  late Color? textColor;
  late Color? timeColor;

  NotificationModel();

  NotificationModel.fromMap(Map<String, dynamic> map) {
    // notificationText = map[DatabaseConstants.notificationText];
    // notificationTime = map[DatabaseConstants.notificationTime];
    // driverId = map[DatabaseConstants.driverId];
    boxColor = ManagerColors.lotion2;
    textColor = ManagerColors.black;
    timeColor = ManagerColors.black50;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // DatabaseConstants.notificationText: notificationText,
      // DatabaseConstants.notificationTime: notificationTime,
      // DatabaseConstants.driverId: driverId,
    };
  }
}
