import '/config/all_imports.dart';

Widget tabBarItem({
  required bool rememberMe,
  required void Function(bool? value) changeRememberMe,
  required void Function() login,
  required GestureRecognizer forgotPasswordRecognizer,
  required GestureRecognizer registerRecognizer,
  required TextEditingController userNumber,
  required TextEditingController password,
  required String labelTextOfUserField,
  required bool obscureText,
  required void Function() changeObscurePassword,
}) {
  return Column(
    children: [
      mainTextField(
        controller: userNumber,
        labelText: labelTextOfUserField,
      ),
      SizedBox(height: ManagerHeight.h20),
      mainTextField(
        controller: password,
        labelText: ManagerStrings.password,
        obscureText: obscureText,
        isPassword: true,
        changeObscureText: changeObscurePassword,
      ),
      SizedBox(height: ManagerHeight.h10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: rememberMe,
                splashRadius: AppConstants.splashRadiusOfCheckboxInLoginScreen,
                focusColor: Colors.red,
                hoverColor: Colors.black,
                onChanged: changeRememberMe,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(ManagerRadius.r5),
                ),
                side: const BorderSide(
                  color: ManagerColors.primaryColor,
                  width: 1.5,
                ),
              ),
              Text(
                ManagerStrings.rememberMe,
                style: TextStyle(
                  fontFamily: ManagerFontFamily.cairo,
                  fontSize: ManagerFontsSizes.f13,
                  fontWeight: ManagerFontWeight.medium,
                  color: ManagerColors.philippineGray,
                ),
              )
            ],
          ),
          RichText(
            text: TextSpan(
              text: ManagerStrings.forgotYourPassword,
              recognizer: forgotPasswordRecognizer,
              style: TextStyle(
                color: ManagerColors.philippineGray,
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.medium,
                fontSize: ManagerFontsSizes.f13,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: ManagerHeight.h32),
      mainButton(
        onPressed: () => login(),
        child: Text(
          ManagerStrings.login,
          style: TextStyle(
            color: ManagerColors.white,
            fontSize: ManagerFontsSizes.f18,
            fontWeight: ManagerFontWeight.bold,
            fontFamily: ManagerFontFamily.cairo,
          ),
        ),
      ),
      SizedBox(height: ManagerHeight.h16),
      RichText(
        text: TextSpan(
          text: ManagerStrings.doNotHaveAnAccount,
          style: TextStyle(
            color: ManagerColors.gunmetal,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.medium,
            fontSize: ManagerFontsSizes.f15,
          ),
          children: [
            TextSpan(
              text: ' ${ManagerStrings.subscribe}',
              recognizer: registerRecognizer,
              style: TextStyle(
                color: ManagerColors.primaryColor,
                fontFamily: ManagerFontFamily.cairo,
                fontWeight: ManagerFontWeight.medium,
                fontSize: ManagerFontsSizes.f15,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
