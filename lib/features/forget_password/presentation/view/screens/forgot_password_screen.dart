import '/config/all_imports.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({required this.isDriver, super.key});

  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(context),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(ManagerStrings.forgotPassword),
          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsetsDirectional.only(
                start: ManagerWidth.w28,
                end: ManagerWidth.w28,
                top: ManagerHeight.h38,
              ),
              children: [
                SvgPicture.asset(
                  ManagerAssets.forgotPasswordImage,
                  height: ManagerHeight.h182,
                  width: ManagerWidth.w275,
                ),
                verticalSpace(ManagerHeight.h50),
                Text(
                  isDriver
                      ? ManagerStrings.enterLicenseNumber
                      : ManagerStrings.enterTheJobNumber,
                  textAlign: TextAlign.center,
                  style: context.textTheme
                      .titleForgotAndChangePasswordAndVerificationCodeScreens(
                          context),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    top: ManagerHeight.h8,
                    bottom: ManagerHeight.h20,
                    start: ManagerWidth.w14,
                    end: ManagerWidth.w14,
                  ),
                  child: Text(
                    isDriver
                        ? ManagerStrings
                            .pleaseEnterYourLicenseNumberToRecoverYourPassword
                        : ManagerStrings
                            .pleaseEnterYourJobNumberToRecoverYourPassword,
                    textAlign: TextAlign.center,
                    style: context.textTheme
                        .subTitleForgotAndChangePasswordAndVerificationCodeScreens(
                            context),
                  ),
                ),
                CustomTextField(
                  validator: (v) => isDriver
                      ? Validator.licenseNumberValidator(v)
                      : Validator.jobNumberValidator(v),
                  controller: controller.inputNumber,
                  labelText: isDriver
                      ? ManagerStrings.licenseNumber
                      : ManagerStrings.jobNumber,
                  maxLength: isDriver
                      ? AppConstants.maxLengthOfLicenseNumber
                      : AppConstants.maxLengthOfJobNumber,
                ),
                verticalSpace(ManagerHeight.h24),
                CustomButton(
                  onPressed: () => controller.sendButton(isDriver, context),
                  child: Text(
                    ManagerStrings.send,
                    style: context.textTheme.mainButtonTextStyle(context),
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
