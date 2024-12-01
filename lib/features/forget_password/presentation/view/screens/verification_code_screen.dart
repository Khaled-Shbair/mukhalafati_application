import '/config/all_imports.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({
    required this.phoneNumber,
    required this.id,
    required this.verificationCode,
    required this.isDriver,
    super.key,
  });

  final String phoneNumber;
  final int id;
  final int verificationCode;
  final bool isDriver;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationCodeController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(ManagerStrings.verification),
          ),
          body: ListView(
            primary: false,
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
              top: ManagerHeight.h64,
            ),
            children: [
              Visibility(
                visible: controller.returnCodeIsInCorrect,
                replacement: SvgPicture.asset(
                  ManagerAssets.verificationImage,
                  height: ManagerHeight.h203,
                  width: ManagerWidth.w290,
                ),
                child: Image.asset(
                  ManagerAssets.inputIncorrect,
                  height: ManagerHeight.h185,
                  width: ManagerWidth.w187,
                ),
              ),
              SizedBox(height: ManagerHeight.h30),
              Text(
                ManagerStrings.enterVerificationCode,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ManagerColors.black,
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontsSizes.f15,
                ),
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
                  style: TextStyle(
                    height: 2,
                    color: ManagerColors.davyGrey,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                    fontSize: ManagerFontsSizes.f15,
                  ),
                ),
              ),
              Row(
                children: [
                  filedOfVerificationCode(
                    controller: controller.oneNumberOfCode,
                    focusNode: controller.oneFocusNode,
                    onChanged: (value) => controller.onChangeOneFiled(value),
                    changeBorderColor: controller.changeBorderColorOneFiled,
                  ),
                  filedOfVerificationCode(
                    controller: controller.twoNumberOfCode,
                    focusNode: controller.twoFocusNode,
                    onChanged: (value) => controller.onChangeTwoFiled(value),
                    changeBorderColor: controller.changeBorderColorTwoFiled,
                  ),
                  filedOfVerificationCode(
                    controller: controller.threeNumberOfCode,
                    focusNode: controller.threeFocusNode,
                    onChanged: (value) => controller.onChangeThreeFiled(value),
                    changeBorderColor: controller.changeBorderColorThreeFiled,
                  ),
                  filedOfVerificationCode(
                    controller: controller.fourNumberOfCode,
                    focusNode: controller.fourFocusNode,
                    onChanged: (value) => controller.onChangeFourFiled(value),
                    changeBorderColor: controller.changeBorderColorFourFiled,
                  ),
                  filedOfVerificationCode(
                    controller: controller.fiveNumberOfCode,
                    focusNode: controller.fiveFocusNode,
                    onChanged: (value) => controller.onChangeFiveFiled(value),
                    changeBorderColor: controller.changeBorderColorFiveFiled,
                  ),
                  filedOfVerificationCode(
                    controller: controller.sexNumberOfCode,
                    focusNode: controller.sexFocusNode,
                    onChanged: (value) => controller.onChangeSexFiled(value),
                    changeBorderColor: controller.changeBorderColorSexFiled,
                  ),
                ],
              ),
              Visibility(
                visible: controller.returnCodeIsInCorrect,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                maintainInteractivity: true,
                maintainSemantics: true,
                child: Text(
                  ManagerStrings.theEnteredCodeIsIncorrect,
                  style: TextStyle(
                    color: ManagerColors.bittersweetShimmer,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                    fontSize: ManagerFontsSizes.f12,
                  ),
                ),
              ),
              SizedBox(height: ManagerHeight.h10),
              mainButton(
                onPressed: () =>
                    controller.verifyButton(id, isDriver, verificationCode),
                child: Text(
                  ManagerStrings.verify,
                  style: TextStyle(
                    color: ManagerColors.white,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f16,
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
