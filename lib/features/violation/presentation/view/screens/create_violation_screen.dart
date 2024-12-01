import '/config/all_imports.dart';

class CreateViolationScreen extends StatelessWidget {
  const CreateViolationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateViolationController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          endDrawer: policeManDrawer(
            isCreateViolationScreen: true,
            policeName: controller.policeName,
            policeImage: controller.policeImage,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.createViolation),
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
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h10,
            ),
            primary: false,
            children: [
              Container(
                width: ManagerWidth.infinity,
                padding: EdgeInsetsDirectional.only(
                  start: ManagerWidth.w18,
                  end: ManagerWidth.w18,
                  top: ManagerHeight.h8,
                  bottom: ManagerHeight.h15,
                ),
                margin: EdgeInsetsDirectional.only(
                  bottom: ManagerHeight.h20,
                ),
                decoration: BoxDecoration(
                  color: ManagerColors.lotion,
                  borderRadius: BorderRadius.circular(ManagerRadius.r5),
                ),
                child: Column(
                  children: [
                    headOfOfficialPaper(),
                    SizedBox(height: ManagerHeight.h15),
                    const Divider(
                      color: ManagerColors.black,
                      thickness:
                          AppConstants.thicknessOfDividerInCreateViolation,
                      height: AppConstants.heightOfDividerInCreateViolation,
                    ),
                    SizedBox(height: ManagerHeight.h19),
                    mainTextField(
                      controller: controller.driverName,
                      labelText: ManagerStrings.driverName,
                      keyboardType: TextInputType.name,
                    ),
                    mySizedBox(),
                    mainTextField(
                      controller: controller.driverIdNumber,
                      labelText: ManagerStrings.driverId,
                      maxLength: AppConstants.maxLengthOfIDNumber,
                    ),
                    mySizedBox(),
                    mainTextField(
                      controller: controller.ownerName,
                      labelText: ManagerStrings.ownerName,
                      keyboardType: TextInputType.name,
                    ),
                    mySizedBox(),
                    mainTextField(
                      controller: controller.ownerId,
                      labelText: ManagerStrings.ownerId,
                      maxLength: AppConstants.maxLengthOfIDNumber,
                    ),
                    mySizedBox(),
                    Row(
                      children: [
                        Expanded(
                          child: mainTextField(
                            controller: controller.vehicleNumber,
                            labelText: ManagerStrings.vehicleNumber,
                            maxLength: AppConstants.maxLengthOfVehicleNumber,
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w10),
                        Expanded(
                          child: mainTextField(
                            controller: controller.vehicleType,
                            labelText: ManagerStrings.vehicleType,
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w10),
                        Expanded(
                          child: mainTextField(
                            controller: controller.vehicleColor,
                            labelText: ManagerStrings.vehicleColor,
                            keyboardType: TextInputType.text,
                            maxLength: AppConstants.maxLengthOfVehicleColor,
                          ),
                        ),
                      ],
                    ),
                    mySizedBox(),
                    Row(
                      children: [
                        Expanded(
                          child: mainTextField(
                            controller: controller.violationTime,
                            labelText: ManagerStrings.violationTime,
                            readOnly: true,
                          ),
                        ),
                        SizedBox(width: ManagerWidth.w10),
                        Expanded(
                          child: mainTextField(
                            controller: controller.violationDate,
                            labelText: ManagerStrings.violationDate,
                            readOnly: true,
                          ),
                        ),
                      ],
                    ),
                    mySizedBox(),
                    mainTextField(
                      controller: controller.placeOfViolation,
                      labelText: ManagerStrings.placeOfViolation,
                      keyboardType: TextInputType.text,
                    ),
                    mySizedBox(),
                    mainTextField(
                      controller: controller.reasonForViolation,
                      labelText: ManagerStrings.reasonForViolation,
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              mainButton(
                onPressed: () => controller.createViolation(context),
                child: Text(
                  ManagerStrings.createViolation,
                  style: TextStyle(
                    color: ManagerColors.white,
                    fontSize: ManagerFontsSizes.f14,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.extraBold,
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
