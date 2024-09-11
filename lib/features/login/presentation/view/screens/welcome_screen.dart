import '/config/all_imports.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          body: Column(
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
                  ManagerAssets.login,
                  width: ManagerWidth.w320,
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
                  start: ManagerWidth.w74,
                  end: ManagerWidth.w74,
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
                      fontSize: ManagerFontsSizes.f18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w74,
                  end: ManagerWidth.w74,
                ),
                child: mainButton(
                  color: ManagerColors.white,
                  onPressed: () => controller.createAccountButton(),
                  child: Text(
                    ManagerStrings.createAccount,
                    style: TextStyle(
                      color: ManagerColors.black,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.bold,
                      fontSize: ManagerFontsSizes.f18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
