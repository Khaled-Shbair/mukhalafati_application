import '/config/all_imports.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LogoutController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ManagerColors.white,
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
                  color: ManagerColors.white,
                  borderRadius: BorderRadius.circular(ManagerRadius.r15),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                      blurRadius:
                          AppConstants.blurRadiusOfBoxShadowInLogoutScreen,
                      spreadRadius:
                          AppConstants.spreadRadiusOfBoxShadowInLogoutScreen,
                      color: ManagerColors.black5,
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
                    SizedBox(height: ManagerHeight.h20),
                    Text(
                      ManagerStrings.doYouWantToLogoutOfTheApplication,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ManagerColors.eerieBlack,
                        fontWeight: ManagerFontWeight.semiBold,
                        fontFamily: ManagerFontFamily.cairo,
                        fontSize: ManagerFontsSizes.f20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: ManagerHeight.h20),
                    Row(
                      children: [
                        mainButton(
                          onPressed: () => controller.cancelButton(),
                          borderRadius: ManagerRadius.r5,
                          height: ManagerHeight.h40,
                          minWidth: ManagerWidth.w99,
                          color: ManagerColors.antiFlashWhite,
                          side: BorderSide.none,
                          child: Text(
                            ManagerStrings.cancel,
                            style: TextStyle(
                              color: ManagerColors.darkGunmetal,
                              fontWeight: ManagerFontWeight.semiBold,
                              fontFamily: ManagerFontFamily.cairo,
                              fontSize: ManagerFontsSizes.f14,
                            ),
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w7),
                        mainButton(
                          onPressed: () => controller.logoutButton(),
                          borderRadius: ManagerRadius.r5,
                          height: ManagerHeight.h40,
                          minWidth: ManagerWidth.w122,
                          child: Text(
                            ManagerStrings.logout,
                            style: TextStyle(
                              color: ManagerColors.white,
                              fontWeight: ManagerFontWeight.bold,
                              fontFamily: ManagerFontFamily.cairo,
                              fontSize: ManagerFontsSizes.f12,
                            ),
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
