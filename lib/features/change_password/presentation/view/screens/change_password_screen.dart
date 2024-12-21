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
                height: ManagerHeight.h185,
                width: ManagerWidth.infinity,
              ),
              verticalSpace(ManagerHeight.h50),
              Text(
                ManagerStrings.enterNewPassword,
                textAlign: TextAlign.center,
                style: context.textTheme.titleMedium,
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
                  style: context.textTheme.bodyMedium,
                ),
              ),
              verticalSpace(ManagerHeight.h8),
              MainTextField(
                controller: controller.newPassword,
                labelText: ManagerStrings.newPassword,
                isPassword: true,
                obscureText: controller.obscureNewPassword,
                keyboardType: TextInputType.visiblePassword,
                changeObscureText: () => controller.changeObscureNewPassword(),
              ),
              verticalSpace(ManagerHeight.h15),
              MainTextField(
                controller: controller.confirmPassword,
                labelText: ManagerStrings.confirmPassword,
                obscureText: controller.obscureConfirmPassword,
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                changeObscureText: () =>
                    controller.changeObscureConfirmPassword(),
              ),
              verticalSpace(ManagerHeight.h24),
              mainButton(
                onPressed: () =>
                    controller.changePasswordButton(isDriver, id, context),
                child: Text(
                  ManagerStrings.changePassword,
                  style: context.textTheme.labelMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
