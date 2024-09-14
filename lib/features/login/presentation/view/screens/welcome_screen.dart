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
                  Container(
                    margin: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w70,
                      end: ManagerWidth.w70,
                      bottom: ManagerHeight.h55,
                      top: ManagerHeight.h7,
                    ),
                    child: Text(
                      ManagerStrings.subTitleLogin,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ManagerFontFamily.cairo,
                        color: ManagerColors.blackOlive,
                        fontSize: ManagerFontsSizes.f14,
                        fontWeight: ManagerFontWeight.medium,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w28,
                      end: ManagerWidth.w28,
                      bottom: ManagerHeight.h16,
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
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: ManagerWidth.w28,
                      end: ManagerWidth.w28,
                    ),
                    child: mainButton(
                      color: ManagerColors.white,
                      onPressed: () => controller.createAccountButton(),
                      child: Text(
                        ManagerStrings.createAccount,
                        style: TextStyle(
                          color: ManagerColors.primaryColor,
                          fontFamily: ManagerFontFamily.cairo,
                          fontWeight: ManagerFontWeight.semiBold,
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
