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
          endDrawer: driverDrawer(
            driverName: controller.driverName,
            driverImage: controller.driverImage,
            isProfileScreen: true,
          ),
          appBar: AppBar(
            title: Text(ManagerStrings.profile),
            automaticallyImplyLeading: false,
            actions: [
              mainButton(
                onPressed: () => controller.openEndDrawer(),
                minWidth: ManagerWidth.w30,
                height: ManagerHeight.h30,
                color: ManagerColors.transparent,
                highlightColor: ManagerColors.transparent,
                splashColor: ManagerColors.transparent,
                side: BorderSide.none,
                child: Icon(
                  Icons.menu,
                  color: ManagerColors.black,
                  size: ManagerIconsSizes.i30,
                ),
              ),
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
              CircleAvatar(
                radius: ManagerRadius.r66,
                backgroundColor: ManagerColors.primaryColor,
                child: CircleAvatar(
                  radius: ManagerRadius.r64,
                  backgroundColor: ManagerColors.white,
                  child: CircleAvatar(
                    radius: ManagerRadius.r60,
                    backgroundImage:
                        cachedNetworkImageProvider(controller.driverImage),
                  ),
                ),
              ),
              SizedBox(height: ManagerHeight.h70),
              mainTextField(
                controller: controller.driverNameController,
                labelText: ManagerStrings.fullName,
                borderColor: ManagerColors.primaryColor,
                colorLabelText: ManagerColors.primaryColor,
                fontSizeLabelText: ManagerFontsSizes.f14,
                fontWeightLabelText: ManagerFontWeight.bold,
                keyboardType: TextInputType.name,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              SizedBox(height: ManagerHeight.h22),
              mainTextField(
                controller: controller.phoneNumberController,
                labelText: ManagerStrings.phoneNumber,
                maxLength: AppConstants.maxLengthOfPhoneNumber,
                borderColor: ManagerColors.primaryColor,
                colorLabelText: ManagerColors.primaryColor,
                fontSizeLabelText: ManagerFontsSizes.f14,
                fontWeightLabelText: ManagerFontWeight.bold,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              SizedBox(height: ManagerHeight.h22),
              mainTextField(
                controller: controller.licenceNumberController,
                labelText: ManagerStrings.licenseNumber,
                borderColor: ManagerColors.primaryColor,
                colorLabelText: ManagerColors.primaryColor,
                fontSizeLabelText: ManagerFontsSizes.f14,
                fontWeightLabelText: ManagerFontWeight.bold,
                maxLength: AppConstants.maxLengthOfLicenseNumber,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              SizedBox(height: ManagerHeight.h22),
              mainTextField(
                controller: controller.idNumberController,
                labelText: ManagerStrings.idNumber,
                borderColor: ManagerColors.primaryColor,
                colorLabelText: ManagerColors.primaryColor,
                fontSizeLabelText: ManagerFontsSizes.f14,
                fontWeightLabelText: ManagerFontWeight.bold,
                maxLength: AppConstants.maxLengthOfIDNumber,
                contentPadding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w23,
                ),
              ),
              SizedBox(height: ManagerHeight.h38),
              mainButton(
                onPressed: () => controller.updateDataButton(),
                child: Text(
                  ManagerStrings.updateData,
                  style: TextStyle(
                    color: ManagerColors.white,
                    fontSize: ManagerFontsSizes.f15,
                    fontWeight: ManagerFontWeight.bold,
                    fontFamily: ManagerFontFamily.cairo,
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
