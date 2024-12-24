import '/config/all_imports.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogoutController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
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
                        CustomButton(
                          onPressed: () => controller.cancelButton(),
                          height: ManagerHeight.h40,
                          minWidth: ManagerWidth.w85,
                          backgroundColor: context.theme.colorScheme.primaryContainer,
                          side: BorderSide.none,
                          child: Text(
                            ManagerStrings.cancel,
                            style: context.textTheme.cancelLogoutButton(context),
                          ),
                        ),
                        horizontalSpace(ManagerWidth.w7),
                        CustomButton(
                          onPressed: () => controller.logoutButton(),
                          height: ManagerHeight.h40,
                          minWidth: ManagerWidth.w122,
                          child: Text(
                            ManagerStrings.logout,
                            style: context.textTheme.logoutAndCreateComplaintAndNameDriverButton(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
