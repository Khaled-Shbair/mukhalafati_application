import '/config/all_imports.dart';

Future<void> customLogoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    barrierColor: ManagerColors.white,
    builder: (context) {
      return GetBuilder<LogoutController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w48,
                  end: ManagerWidth.w48,
                ),
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w24,
                  top: ManagerHeight.h26,
                  end: ManagerWidth.w24,
                  bottom: ManagerHeight.h34,
                ),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(ManagerRadius.r15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                      blurRadius:
                          AppConstants.blurRadiusOfBoxShadowInLogoutScreen,
                      spreadRadius:
                          AppConstants.spreadRadiusOfBoxShadowInLogoutScreen,
                      color: context.theme.colorScheme.shadow,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      ManagerAssets.questionLogout,
                      height: ManagerHeight.h120,
                      width: ManagerWidth.w120,
                    ),
                    verticalSpace(ManagerHeight.h20),
                    Text(
                      ManagerStrings.doYouWantToLogoutOfTheApplication,
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLogoutScreen(context),
                    ),
                    verticalSpace(ManagerHeight.h20),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            onPressed: () => controller.cancelButton(context),
                            height: ManagerHeight.h40,
                            backgroundColor:
                                context.theme.colorScheme.primaryContainer,
                            side: BorderSide.none,
                            child: Text(
                              ManagerStrings.cancel,
                              style:
                                  context.textTheme.cancelLogoutButton(context),
                            ),
                          ),
                        ),
                        horizontalSpace(ManagerWidth.w7),
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            onPressed: () => controller.logoutButton(context),
                            height: ManagerHeight.h40,
                            child: Text(
                              ManagerStrings.logout,
                              style: context.textTheme
                                  .logoutAndCreateComplaintAndNameDriverButton(
                                      context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
