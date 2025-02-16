import '/config/all_imports.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          endDrawer: CustomDriverDrawer(),
          appBar: AppBar(
            title: Text(ManagerStrings.notifications),
            leading: IconButton(
              onPressed: () => controller.backButton(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${controller.notifications.length} ${ManagerStrings.unReadMessages}',
                      style: TextStyle(
                        color: ManagerColors.black50,
                        fontWeight: ManagerFontWeight.semiBold,
                        fontFamily: ManagerFontFamily.cairo,
                        fontSize: ManagerFontsSizes.f13,
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.deleteNotifications(),
                      icon: Icon(
                        Icons.delete,
                        color: ManagerColors.primaryColor,
                        size: ManagerIconsSizes.i24,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    primary: false,
                    padding: EdgeInsetsDirectional.only(
                      bottom: ManagerHeight.h15,
                      top: ManagerHeight.h10,
                    ),
                    itemCount: controller.notifications.length,
                    itemBuilder: (context, index) {
                      if (controller.loading == true) {
                        return CustomLoading();
                      } else {
                        return boxOfNotification(
                          onLongPress: () =>
                              controller.onLongPressOnBoxOfNotification(
                            controller.notifications[index].notificationId,
                            index,
                          ),
                          color: controller.notifications[index].boxColor,
                          colorText: controller.notifications[index].textColor,
                          colorTime: controller.notifications[index].timeColor,
                          text: controller.notifications[index].text,
                          time: controller.notifications[index].time,
                        );
                      }
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: ManagerHeight.h15);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
