import '/config/all_imports.dart';

class DataNotification {
  String text;
  String time;
  Color? boxColor;
  Color? textColor;
  Color? timeColor;

  DataNotification({
    required this.text,
    required this.time,
    this.boxColor = ManagerColors.lotion2,
    this.textColor = ManagerColors.black,
    this.timeColor = ManagerColors.black50,
  });
}
