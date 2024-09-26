import '/config/all_imports.dart';

class ForgotPasswordForPoliceManScreen extends StatelessWidget {
  const ForgotPasswordForPoliceManScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordForPoliceManController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(ManagerStrings.forgotPassword),
          ),
          body: ListView(
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
                width: ManagerWidth.infinity,
              ),
              SizedBox(height: ManagerHeight.h50),
              Text(
                ManagerStrings.enterTheJobNumber,
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
                  ManagerStrings.pleaseEnterYourJobNumberToRecoverYourPassword,
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
              mainTextField(
                controller: controller.jobNumber,
                labelText: ManagerStrings.jobNumber,
                colorLabelText: ManagerColors.quartz,
                maxLength: AppConstants.maxLengthOfJobNumber,
              ),
              SizedBox(height: ManagerHeight.h24),
              mainButton(
                onPressed: () => controller.sendButton(),
                child: Text(
                  ManagerStrings.send,
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
