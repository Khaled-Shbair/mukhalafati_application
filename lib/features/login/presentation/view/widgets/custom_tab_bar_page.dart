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
    required this.formKey,
    required this.validatorNumber,
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
  final GlobalKey<FormState> formKey;
  final String? Function(String?) validatorNumber;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          verticalSpace(ManagerHeight.h24),
          CustomTextField(
            controller: userNumber,
            labelText: labelTextOfUserField,
            validator: (v) => validatorNumber(v),
          ),
          verticalSpace(ManagerHeight.h20),
          CustomTextField(
            validator: (v) => Validator.passwordValidator(v),
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
                textStyle: context.textTheme
                    .forgotPasswordButtonAndTextOfCheckBoxInLoginScreen(
                    context),
                title: ManagerStrings.forgotYourPassword,
                recognizer: forgotPasswordRecognizer,
              ),
            ],
          ),
          verticalSpace(ManagerHeight.h32),
          CustomButton(
            onPressed: () => login(),
            child: Text(
              ManagerStrings.login,
              style: context.textTheme.mainButtonTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
