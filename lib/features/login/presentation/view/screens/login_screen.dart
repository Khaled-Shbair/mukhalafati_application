import '/config/all_imports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
            ),
            child: Column(
              children: [
                Image.asset(
                  ManagerAssets.logo,
                  height: ManagerHeight.h71,
                  width: ManagerWidth.w85,
                  fit: BoxFit.cover,
                ),
                verticalSpace(ManagerHeight.h20),
                Text(
                  ManagerStrings.login,
                  style: context.textTheme
                      .titleOnBoardingAndWelcomeAndLoginScreen(context),
                ),
                verticalSpace(ManagerHeight.h8),
                Text(
                  ManagerStrings.welcomeBackToOurApp,
                  style:
                      context.textTheme.subTitleWelcomeAndLoginScreens(context),
                ),
                verticalSpace(ManagerHeight.h16),
                Container(
                  height: ManagerHeight.h48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: TabBar(
                    controller: controller.tabController,
                    indicatorColor: context.theme.tabBarTheme.indicatorColor,
                    dividerColor: context.theme.tabBarTheme.dividerColor,
                    indicator: context.theme.tabBarTheme.indicator,
                    labelPadding: context.theme.tabBarTheme.labelPadding,
                    labelStyle: context.theme.tabBarTheme.labelStyle,
                    unselectedLabelStyle:
                        context.theme.tabBarTheme.unselectedLabelStyle,
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
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CustomTabBarPage(
                        changeRememberMe: (bool? v) =>
                            controller.changeRememberMeDriver(v!),
                        forgotPasswordRecognizer:
                            controller.forgetDriverPasswordRecognizer,
                        rememberMe: controller.rememberMeDriver,
                        obscureText: controller.obscurePasswordDriver,
                        changeObscurePassword: () =>
                            controller.changeObscurePasswordDriver(),
                        login: () => controller.loginDriver(context),
                        labelTextOfUserField: ManagerStrings.licenseNumber,
                        password: controller.passwordDriver,
                        userNumber: controller.licenseNumber,
                      ),
                      CustomTabBarPage(
                        changeRememberMe: (bool? v) =>
                            controller.changeRememberMePoliceMan(v!),
                        forgotPasswordRecognizer:
                            controller.forgetPoliceManPasswordRecognizer,
                        login: () => controller.loginPoliceMan(context),
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
