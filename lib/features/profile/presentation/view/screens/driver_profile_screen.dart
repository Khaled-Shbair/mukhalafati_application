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
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: ListView(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w22,
              end: ManagerWidth.w22,
              top: ManagerHeight.h28,
              bottom: ManagerHeight.h20,
            ),
            primary: true,
            children: [
              CustomImageProfile(imagePath: controller.driverImage),
              verticalSpace(ManagerHeight.h70),
              CustomTextField(
                borderColor: context.theme.primaryColor,
                controller: controller.driverName,
                labelText: ManagerStrings.fullName,
                labelStyle:
                    context.textTheme.labelStyleOfDataInDriverProfile(context),
                keyboardType: TextInputType.name,
                inputTextStyle:
                    context.textTheme.textStyleOfUserDataInProfile(context),
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h22),
              CustomTextField(
                controller: controller.driverPhone,
                labelText: ManagerStrings.phoneNumber,
                maxLength: AppConstants.maxLengthOfPhoneNumber,
                labelStyle:
                    context.textTheme.labelStyleOfDataInDriverProfile(context),
                inputTextStyle:
                    context.textTheme.textStyleOfUserDataInProfile(context),
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
                borderColor: context.theme.primaryColor,
              ),
              verticalSpace(ManagerHeight.h22),
              CustomTextField(
                borderColor: context.theme.primaryColor,
                controller: controller.licenceNumber,
                labelText: ManagerStrings.licenseNumber,
                labelStyle:
                    context.textTheme.labelStyleOfDataInDriverProfile(context),
                maxLength: AppConstants.maxLengthOfLicenseNumber,
                inputTextStyle:
                    context.textTheme.textStyleOfUserDataInProfile(context),
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h22),
              CustomTextField(
                borderColor: context.theme.primaryColor,
                labelStyle:
                    context.textTheme.labelStyleOfDataInDriverProfile(context),
                controller: controller.driverId,
                labelText: ManagerStrings.idNumber,
                maxLength: AppConstants.maxLengthOfIDNumber,
                inputTextStyle:
                    context.textTheme.textStyleOfUserDataInProfile(context),
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              verticalSpace(ManagerHeight.h38),
              CustomButton(
                onPressed: () => controller.updateDataButton(context),
                child: Text(
                  ManagerStrings.updateData,
                  style: context.textTheme.mainButtonTextStyle(context),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
