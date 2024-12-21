import '/config/all_imports.dart';

class CustomTabBarPage extends StatelessWidget {
  const CustomTabBarPage({
    required this.login,
    required this.rememberMe,
    required this.changeObscurePassword,
    required this.changeRememberMe,
    required this.forgotPasswordRecognizer,
    required this.userNumber,
    required this.password,
    required this.labelTextOfUserField,
    required this.obscureText,
    super.key,
  });

  final bool rememberMe;
  final Function(bool? value) changeRememberMe;
  final Function() login;
  final GestureRecognizer forgotPasswordRecognizer;
  final TextEditingController userNumber;
  final TextEditingController password;
  final String labelTextOfUserField;
  final bool obscureText;
  final Function() changeObscurePassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(ManagerHeight.h24),
        MainTextField(
          controller: userNumber,
          labelText: labelTextOfUserField,
        ),
        verticalSpace(ManagerHeight.h20),
        MainTextField(
          controller: password,
          labelText: ManagerStrings.password,
          obscureText: obscureText,
          isPassword: true,
          keyboardType: TextInputType.visiblePassword,
          changeObscureText: changeObscurePassword,
        ),
        verticalSpace(ManagerHeight.h10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomCheckBox(
              value: rememberMe,
              onChanged: changeRememberMe,
            ),
            CustomRichText(
              title: ManagerStrings.forgotYourPassword,
              recognizer: forgotPasswordRecognizer,
            ),
          ],
        ),
        verticalSpace(ManagerHeight.h32),
        mainButton(
          onPressed: () => login(),
          child: Text(
            ManagerStrings.login,
            style: context.textTheme.labelMedium,
          ),
        ),
      ],
    );
  }
}
