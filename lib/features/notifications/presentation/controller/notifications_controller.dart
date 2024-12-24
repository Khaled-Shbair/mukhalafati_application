import '/config/all_imports.dart';

class NotificationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  // int unReadMessagesNumber = 4;
  bool loading = false;

  List notifications = <NotificationModel>[];

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  void backButton() {
    Get.back();
    disposeNotification();
  }

  void deleteNotifications() async {
    confirmInformationDialog(
      title: ManagerStrings.doYouWantToDeleteAllNotifications,
      text: ManagerStrings.notificationsSuccessfullyDeleted,
      textConfirmButton: ManagerStrings.yes,
      textCancelButton: ManagerStrings.no,
      confirmButton: () async {
        // _notificationsDatabase.clear();
      },
      closeButton: () async {
        getNotifications();
        Get.back();
        update();
      },
      context: Get.context!,
    );
  }

  void openEndDrawer() {
    if (scaffoldKey.currentState != null &&
        !scaffoldKey.currentState!.isEndDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void onLongPressOnBoxOfNotification(int notificationId, int index) async {
    notifications[index].boxColor = ManagerColors.primaryColor;
    notifications[index].textColor = ManagerColors.white;
    notifications[index].timeColor = ManagerColors.white80;
    confirmInformationDialog(
      title: ManagerStrings.doYouWantToDeleteNotification,
      text: ManagerStrings.notificationSuccessfullyDeleted,
      textConfirmButton: ManagerStrings.yes,
      textCancelButton: ManagerStrings.no,
      confirmButton: () {
        // _notificationsDatabase.delete(notificationId);
      },
      closeButton: () {
        getNotifications();
        Get.back();
      },
      cancelButton: () {
        notifications[index].boxColor = ManagerColors.lotion2;
        notifications[index].textColor = ManagerColors.black;
        notifications[index].timeColor = ManagerColors.black50;
        Get.back();
        update();
      },
      context: Get.context!,
    );

    update();
  }

  void getNotifications() async {
    loading = true;
    // notifications = await _notificationsDatabase.read();
    loading = false;
    update();
  }
}
