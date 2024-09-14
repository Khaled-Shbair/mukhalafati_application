import 'package:mukhalafati_application/features/login/presentation/view/widgets/tab_bar_button.dart';
import 'package:mukhalafati_application/features/login/presentation/view/widgets/tab_bar_page.dart';

import '/config/all_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ManagerColors.white,
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            leading: mainButton(
              highlightColor: ManagerColors.transparent,
              side: BorderSide.none,
              shape: const CircleBorder(),
              onPressed: () => controller.backButton(),
              color: Colors.transparent,
              child: const Icon(
                Icons.arrow_back_ios,
                color: ManagerColors.primaryColor,
                size: 20,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ManagerAssets.logo,
                  height: ManagerHeight.h105,
                  width: ManagerWidth.w105,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: ManagerHeight.h2),
                Text(
                  ManagerStrings.login,
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f22,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                  ),
                ),
                SizedBox(height: ManagerHeight.h8),
                Text(
                  ManagerStrings.welcomeBackToOurApp,
                  style: TextStyle(
                    color: ManagerColors.blackOlive,
                    fontSize: ManagerFontsSizes.f14,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                  ),
                ),
                SizedBox(height: ManagerHeight.h16),
                Container(
                  height: ManagerHeight.h48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: ManagerColors.ghostWhite,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorColor: ManagerColors.primaryColor,
                    dividerColor: ManagerColors.transparent,
                    indicator: BoxDecoration(
                      color: ManagerColors.primaryColor,
                      borderRadius: BorderRadius.circular(ManagerRadius.r5),
                    ),
                    labelPadding: EdgeInsetsDirectional.only(
                      top: ManagerHeight.h7,
                      bottom: ManagerHeight.h7,
                    ),
                    // indicatorPadding: EdgeInsetsDirectional.only(
                    //   bottom: ManagerHeight.h5,
                    //   top: ManagerHeight.h5,
                    //   start: ManagerWidth.w16,
                    //   end: ManagerWidth.w16,
                    // ),
                    labelStyle: TextStyle(
                      color: ManagerColors.white,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.medium,
                      fontSize: ManagerFontsSizes.f15,
                    ),
                    unselectedLabelStyle: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.medium,
                      fontSize: ManagerFontsSizes.f15,
                    ),
                    tabs: [
                      tabBarButton(
                        image: ManagerAssets.driverIcon,
                        name: ManagerStrings.driver,
                      ),
                      tabBarButton(
                        image: ManagerAssets.policeIcon,
                        name: ManagerStrings.police,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: ManagerHeight.h24),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      tabBarPage(
                        changeRememberMe: (bool? v) =>
                            controller.changeRememberMeDriver(v!),
                        forgotPasswordRecognizer:
                            controller.forgetDriverPasswordRecognizer,
                        registerRecognizer: controller.registerDriverRecognizer,
                        rememberMe: controller.rememberMeDriver,
                        obscureText: controller.obscurePasswordDriver,
                        changeObscurePassword: () =>
                            controller.changeObscurePasswordDriver(),
                        login: () => controller.loginDriver(),
                        labelTextOfUserField: ManagerStrings.licenseNumber,
                        password: controller.passwordDriver,
                        userNumber: controller.licenseNumber,
                      ),
                      tabBarPage(
                        changeRememberMe: (bool? v) =>
                            controller.changeRememberMePoliceMan(v!),
                        forgotPasswordRecognizer:
                            controller.forgetPoliceManPasswordRecognizer,
                        login: () => controller.loginPoliceMan(),
                        registerRecognizer:
                            controller.registerPoliceManRecognizer,
                        rememberMe: controller.rememberMePoliceMan,
                        obscureText: controller.obscurePasswordPoliceMan,
                        changeObscurePassword: () =>
                            controller.changeObscurePasswordPoliceMan(),
                        labelTextOfUserField: ManagerStrings.jobNumber,
                        password: controller.passwordPoliceMan,
                        userNumber: controller.jobNumber,
                      ),
                    ],
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
