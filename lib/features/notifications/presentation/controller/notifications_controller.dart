import '/config/all_imports.dart';

class NotificationsController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final AppSettingsSharedPreferences _sharedPreferences =
      instance<AppSettingsSharedPreferences>();
  late String driverName;
  late String driverImage;

  // int unReadMessagesNumber = 4;
  bool loading = false;

  List notifications = <DataNotification>[
    DataNotification(
      text:
          'قد تم مخالفتك قبل قليل بسبب الزيادة بسرعة المركبة فوق المسموح يرجى اتباع المعلومات',
      time: 'ساعتين',
    ),
    DataNotification(
      text:
          'عزيزي السائق أن تقترب من الفترة المحددة لك لدفع المخالفة التي تمت عليك يرجى متابعة الأمر',
      time: '4 ساعات',
    ),
    DataNotification(
      text:
          'عزيزي السائق انتبه من شارع المسمى “صلاح الدين يوجد هناك حفريات ف كن على حذر',
      time: '3 ساعات',
    ),
    DataNotification(
      text: 'الوقت المناسب لفحص سيارتك  .  حدد موعدًا للفحص الدوري',
      time: 'ساعة',
    ),
    DataNotification(
      text:
          'عزيزي السائق أن تقترب من الفترة المحددة لك لدفع المخالفة التي تمت عليك يرجى متابعة الأمر',
      time: '5 دقائق',
    ),
    DataNotification(
      text:
          'عزيزي السائق أن تقترب من الفترة المحددة لك لدفع المخالفة التي تمت عليك يرجى متابعة الأمر',
      time: '4 ساعات',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    disposeDriverHome();
    driverName =
        '${_sharedPreferences.firstName()} ${_sharedPreferences.lastName()}';
    driverImage = _sharedPreferences.image();
  }

  void backButton() {
    Get.back();
    disposeNotification();
  }

  void deleteNotification() {
    confirmInformationDialog(
      title: ManagerStrings.doYouWantToDeleteAllNotifications,
      text: ManagerStrings.notificationsSuccessfullyDeleted,
      textConfirmButton: ManagerStrings.yes,
      textCancelButton: ManagerStrings.no,
      closeButton: () {
        notifications.clear();
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

  void onLongPressOnBoxOfNotification(int index) async {
    notifications[index].boxColor = ManagerColors.primaryColor;
    notifications[index].textColor = ManagerColors.white;
    notifications[index].timeColor = ManagerColors.white80;
    confirmInformationDialog(
      title: ManagerStrings.doYouWantToDeleteNotification,
      text: ManagerStrings.notificationSuccessfullyDeleted,
      textConfirmButton: ManagerStrings.yes,
      textCancelButton: ManagerStrings.no,
      closeButton: () {
        notifications.removeAt(index);
        Get.back();
        update();
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
}
