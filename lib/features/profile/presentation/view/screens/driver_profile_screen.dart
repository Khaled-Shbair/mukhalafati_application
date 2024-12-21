import '/config/all_imports.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverProfileController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: CustomDriverDrawer(isProfileScreen: true),
          appBar: AppBar(
            title: Text(ManagerStrings.profile),
            automaticallyImplyLeading: false,
            actions: [
              menuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: ListView(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w22,
              end: ManagerWidth.w22,
              top: ManagerHeight.h28,
            ),
            primary: true,
            children: [
              CustomImageProfile(imagePath: controller.driverImage),
              verticalSpace(ManagerHeight.h70),
              MainTextField(
                controller: controller.driverNameController,
                labelText: ManagerStrings.fullName,
                colorLabelText: context.theme.primaryColor,
                keyboardType: TextInputType.name,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h22),
              MainTextField(
                controller: controller.phoneNumberController,
                labelText: ManagerStrings.phoneNumber,
                maxLength: AppConstants.maxLengthOfPhoneNumber,
                colorLabelText: context.theme.primaryColor,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h22),
              MainTextField(
                controller: controller.licenceNumberController,
                labelText: ManagerStrings.licenseNumber,
                colorLabelText: context.theme.primaryColor,
                maxLength: AppConstants.maxLengthOfLicenseNumber,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h22),
              MainTextField(
                controller: controller.idNumberController,
                labelText: ManagerStrings.idNumber,
                colorLabelText: context.theme.primaryColor,
                maxLength: AppConstants.maxLengthOfIDNumber,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h38),
              mainButton(
                onPressed: () => controller.updateDataButton(),
                child: Text(
                  ManagerStrings.updateData,
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
