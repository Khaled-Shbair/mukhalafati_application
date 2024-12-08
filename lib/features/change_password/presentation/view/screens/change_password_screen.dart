import '/config/all_imports.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({
    required this.isDriver,
    required this.id,
    super.key,
  });

  final bool isDriver;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChangePasswordController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () => controller.backButton(),
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: Text(ManagerStrings.changePassword),
          ),
          body: ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w28,
              end: ManagerWidth.w28,
              top: ManagerHeight.h34,
            ),
            children: [
              SvgPicture.asset(
                ManagerAssets.changePasswordImage,
                height: ManagerHeight.h182,
                width: ManagerWidth.infinity,
              ),
              SizedBox(height: ManagerHeight.h50),
              Text(
                ManagerStrings.enterNewPassword,
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
                  ManagerStrings
                      .pleaseEnterNewPasswordWhichMustBeDifferentFromTheOldPassword,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    height: 2,
                    color: ManagerColors.davyGrey,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.medium,
                    fontSize: ManagerFontsSizes.f13,
                  ),
                ),
              ),
              SizedBox(height: ManagerHeight.h8),
              MainTextField(
                controller: controller.newPassword,
                labelText: ManagerStrings.newPassword,
                colorLabelText: ManagerColors.quartz,
                isPassword: true,
                obscureText: controller.obscureNewPassword,
                keyboardType: TextInputType.visiblePassword,
                changeObscureText: () => controller.changeObscureNewPassword(),
              ),
              SizedBox(height: ManagerHeight.h15),
              MainTextField(
                controller: controller.confirmPassword,
                labelText: ManagerStrings.confirmPassword,
                colorLabelText: ManagerColors.quartz,
                obscureText: controller.obscureConfirmPassword,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                changeObscureText: () =>
                    controller.changeObscureConfirmPassword(),
              ),
              SizedBox(height: ManagerHeight.h24),
              mainButton(
                onPressed: () => controller.changePasswordButton(isDriver, id),
                child: Text(
                  ManagerStrings.changePassword,
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
