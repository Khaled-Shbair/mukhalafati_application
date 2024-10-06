import '/config/all_imports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          body: Stack(
            children: [
              Image.asset(
                ManagerAssets.backgroundWelcomeScreen,
                fit: BoxFit.cover,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w38,
                      end: ManagerWidth.w20,
                      bottom: ManagerHeight.h20,
                    ),
                    child: SvgPicture.asset(
                      ManagerAssets.welcomeImage,
                      width: ManagerWidth.w268,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    ManagerStrings.welcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ManagerFontFamily.cairo,
                      color: ManagerColors.blackOlive,
                      fontSize: ManagerFontsSizes.f22,
                      fontWeight: ManagerFontWeight.bold,
                    ),
                  ),
                  SizedBox(height: ManagerHeight.h10),
                  Text(
                    ManagerStrings.subTitleWelcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ManagerFontFamily.cairo,
                      color: ManagerColors.blackOlive,
                      fontSize: ManagerFontsSizes.f14,
                      fontWeight: ManagerFontWeight.medium,
                      height: AppConstants.heightOfSubTitleWelcomeScreen,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w28,
                      end: ManagerWidth.w28,
                      bottom: ManagerHeight.h16,
                      top: ManagerHeight.h30,
                    ),
                    child: mainButton(
                      onPressed: () => controller.loginButton(),
                      child: Text(
                        ManagerStrings.login,
                        style: TextStyle(
                          color: ManagerColors.white,
                          fontFamily: ManagerFontFamily.cairo,
                          fontWeight: ManagerFontWeight.bold,
                          fontSize: ManagerFontsSizes.f16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
