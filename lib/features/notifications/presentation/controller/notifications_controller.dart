import '/config/all_imports.dart';

class NotificationsController extends GetxController with CustomToast {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _getAllNotificationsUseCase = instance<GetAllNotificationsUseCase>();
  final _updateNotificationStatusUseCase =
  instance<UpdateNotificationStatusUseCase>();
  bool _loading = false;
  NotificationsModel? _notificationsModel;

  NotificationsModel? get notificationsModel => _notificationsModel;

  bool get loading => _loading;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  @override
  void onInit() {
    super.onInit();
    getNotifications();
  }

  void backButton() {
    Get.back();
    _readAllNotification();
    disposeNotification();
  }

  void deleteNotification(int index, int id, BuildContext context) async {
    final delete = instance<DeleteDriverNotificationsByIdUseCase>();
    (await delete.execute(DeleteDriverNotificationsInput(notificationId: id)))
        .fold(
          (l) {
        if (l.code == -1) {
          showToast(message: l.message, context: context);
        }
      },
          (r) async {
        context.pop();
        _notificationsModel!.data.removeAt(index);
        await customCreatedSuccessfullyDialog(
          context: context,
          closeButton: () {
            context.pop();
          },
          text: ManagerStrings.notificationSuccessfullyDeleted,
        );
      },
    );
  }

  void deleteAllNotification(BuildContext context) async {
    customConfirmInformationDialog(
      context: context,
      title: ManagerStrings.doYouWantToDeleteAllNotifications,
      textConfirmButton: ManagerStrings.yes,
      textCancelButton: ManagerStrings.no,
      confirmButton: () async {
        final delete = instance<DeleteAllNotificationsUseCase>();
        (await delete.execute()).fold(
              (l) {
            if (l.code == -1) {
              showToast(message: l.message, context: context);
            }
          },
              (r) async {
            context.pop();
            _notificationsModel!.data.clear();
            _notificationsModel!.unreadCount = 0;
            update();
            await customCreatedSuccessfullyDialog(
              context: context,
              closeButton: () {
                if (_notificationsModel != null &&
                    _notificationsModel!.data.isNotEmpty) {
                  _notificationsModel!.data.clear();
                }
                context.pop();
              },
              text: ManagerStrings.notificationsSuccessfullyDeleted,
            );
          },
        );
      },
      closeButton: () => context.pop(),
    );
    update();
  }

  /// Open [endDrawer], use this drawer as menu.
  void openEndDrawer() {
    if (_scaffoldKey.currentState != null &&
        !_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
    }
  }

  /// get all notifications of this driver from database
  void getNotifications() async {
    _loading = true;
    (await _getAllNotificationsUseCase.execute()).fold(
          (l) {
        showToast(message: l.message, context: Get.context!);
      },
          (r) {
        _notificationsModel = r;
      },
    );
    _loading = false;
    update();
  }

  //when user open notifications screen, send request to change
  //status of notification = true, to determine all notifications (is_read)
  void _readAllNotification() async {
    (await _updateNotificationStatusUseCase.execute()).fold(
          (l) {},
          (r) {},
    );
  }
}
