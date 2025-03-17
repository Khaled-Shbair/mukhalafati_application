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
                      '  ${controller.notificationsModel?.unreadCount ?? 0} ${ManagerStrings.unReadMessages}',
                      style: context.textTheme
                          .textStyleOfUnReadMessagesInNotificationScreen(
                              context),
                    ),
                    IconButton(
                      onPressed: () =>
                          controller.deleteAllNotification(context),
                      icon: Image.asset(
                        ManagerAssets.deleteIcon,
                        height: ManagerHeight.h22,
                        width: ManagerWidth.w22,
                      ),
                    )
                  ],
                ),
                if (controller.loading == true) ...{
                  Spacer(),
                  CustomLoading(),
                  Spacer(),
                } else if (controller.notificationsModel != null &&
                    controller.notificationsModel!.data.isNotEmpty) ...{
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsetsDirectional.only(
                        bottom: ManagerHeight.h15,
                        top: ManagerHeight.h10,
                      ),
                      itemCount:
                          controller.notificationsModel?.data.length ?? 0,
                      itemBuilder: (context, index) {
                        var data = controller.notificationsModel!.data;
                        return BoxOfNotification(
                          isRead: data[index].isRead,
                          text: data[index].content,
                          id: data[index].id,
                          time: data[index].timeAge,
                          delete: () => controller.deleteNotification(
                              index, data[index].id, context),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return verticalSpace(ManagerHeight.h15);
                      },
                    ),
                  ),
                } else ...{
                  verticalSpace(ManagerHeight.h280),
                  Text(
                    ManagerStrings.noNotifications,
                    style: context.textTheme
                        .textStyleOfEmptyNotificationMessage(context),
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
