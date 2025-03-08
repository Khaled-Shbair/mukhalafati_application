import '/config/all_imports.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({
    required this.id,
    required this.isDriver,
    required this.phoneNumber,
    required this.verificationId,
    super.key,
  });

  final String phoneNumber;
  final int id;
  final String verificationId;
  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationCodeController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(context, isDriver),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(ManagerStrings.verification),
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
              top: ManagerHeight.h40,
            ),
            child: Column(
              children: [
                CustomVerificationImage(
                    isIncorrect: controller.returnCodeIsInCorrect),
                verticalSpace(ManagerHeight.h30),
                Text(
                  ManagerStrings.enterVerificationCode,
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
                    '${ManagerStrings.pleaseEnterTheConfirmationCodeSentToYourMobileNumber} $phoneNumber',
                    textAlign: TextAlign.center,
                    style: context.textTheme
                        .subTitleForgotAndChangePasswordAndVerificationCodeScreens(
                            context),
                  ),
                ),
                Row(
                  children: [
                    CustomFiledOfVerificationCode(
                      controller: controller.oneNumberOfCode,
                      focusNode: controller.oneFocusNode,
                      onChanged: (value) =>
                          controller.onChangeOneFiled(value),
                      changeBorderColor: controller.changeBorderColorOneFiled,
                    ),
                    CustomFiledOfVerificationCode(
                      controller: controller.twoNumberOfCode,
                      focusNode: controller.twoFocusNode,
                      onChanged: (value) =>
                          controller.onChangeTwoFiled(value),
                      changeBorderColor: controller.changeBorderColorTwoFiled,
                    ),
                    CustomFiledOfVerificationCode(
                      controller: controller.threeNumberOfCode,
                      focusNode: controller.threeFocusNode,
                      onChanged: (value) =>
                          controller.onChangeThreeFiled(value),
                      changeBorderColor:
                          controller.changeBorderColorThreeFiled,
                    ),
                    CustomFiledOfVerificationCode(
                      controller: controller.fourNumberOfCode,
                      focusNode: controller.fourFocusNode,
                      onChanged: (value) =>
                          controller.onChangeFourFiled(value),
                      changeBorderColor:
                          controller.changeBorderColorFourFiled,
                    ),
                    CustomFiledOfVerificationCode(
                      controller: controller.fiveNumberOfCode,
                      focusNode: controller.fiveFocusNode,
                      onChanged: (value) =>
                          controller.onChangeFiveFiled(value),
                      changeBorderColor:
                          controller.changeBorderColorFiveFiled,
                    ),
                    CustomFiledOfVerificationCode(
                      controller: controller.sexNumberOfCode,
                      focusNode: controller.sexFocusNode,
                      onChanged: (value) => controller.onChangeSexFiled(
                        value,
                        context,
                        id,
                        isDriver,
                        verificationId,
                      ),
                      changeBorderColor: controller.changeBorderColorSexFiled,
                    ),
                  ],
                ),
                CustomIncorrectEnteredCodeMessage(
                  isIncorrect: controller.returnCodeIsInCorrect,
                ),
                verticalSpace(ManagerHeight.h10),
                CustomButton(
                  onPressed: () => controller.verifyButton(
                    id,
                    isDriver,
                    verificationId,
                    context,
                  ),
                  child: Text(
                    ManagerStrings.verify,
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
