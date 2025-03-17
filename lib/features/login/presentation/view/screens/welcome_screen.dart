import '/config/all_imports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Image.asset(
            ManagerAssets.backgroundWelcomeScreen,
            width: ManagerWidth.infinity,
            height: context.mediaQuery.size.height * 0.5,
            fit: BoxFit.fill,
          ),
          verticalSpace(ManagerHeight.h40),
          Text(
            ManagerStrings.welcome,
            textAlign: TextAlign.center,
            style: context.textTheme
                .titleOnBoardingAndWelcomeAndLoginScreen(context),
          ),
          verticalSpace(ManagerHeight.h10),
          Text(
            ManagerStrings.subTitleWelcome,
            textAlign: TextAlign.center,
            style: context.textTheme.subTitleWelcomeAndLoginScreens(context),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
              bottom: ManagerHeight.h16,
              top: ManagerHeight.h30,
            ),
            child: CustomButton(
              onPressed: () {
                context.pushNamed(Routes.loginScreen);
              },
              child: Text(
                ManagerStrings.login,
                style: context.textTheme.mainButtonTextStyle(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
