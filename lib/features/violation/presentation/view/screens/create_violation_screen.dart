import '/config/all_imports.dart';

class CreateViolationScreen extends StatelessWidget {
  const CreateViolationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ManagerColors.white,
        centerTitle: true,
        title: Text(
          ManagerStrings.createViolation,
          style: TextStyle(
            color: ManagerColors.black,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f17,
          ),
        ),
        actions: [
          mainButton(
            onPressed: () {},
            minWidth: ManagerWidth.w30,
            height: ManagerHeight.h30,
            color: ManagerColors.transparent,
            highlightColor: ManagerColors.transparent,
            splashColor: ManagerColors.transparent,
            side: BorderSide.none,
            child: const Icon(
              Icons.menu,
              color: ManagerColors.black,
              size: 30,
            ),
          ),
        ],
      ),
      body: GetBuilder<CreateViolationController>(
        builder: (controller) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h10,
            ),
            child: Column(
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          headOfViolationPage(
                              text: ManagerStrings.titleHeadViolationAr),
                          Image.asset(ManagerAssets.palestineLogo),
                          headOfViolationPage(
                              text: ManagerStrings.titleHeadViolationEn),
                        ],
                      ),
                      SizedBox(height: ManagerHeight.h15),
                      const Divider(
                        color: ManagerColors.black,
                        thickness:
                            AppConstants.thicknessOfDividerInCreateViolation,
                        height: AppConstants.heightOfDividerInCreateViolation,
                      ),
                      SizedBox(height: ManagerHeight.h19),
                      mainTextField(
                        controller: controller.driverNameController,
                        labelText: ManagerStrings.driverName,
                        keyboardType: TextInputType.name,
                      ),
                      mySizedBox(),
                      mainTextField(
                        controller: controller.driverIdController,
                        labelText: ManagerStrings.driverId,
                        maxLength: AppConstants.maxLengthOfIDNumber,
                      ),
                      mySizedBox(),
                      mainTextField(
                        controller: controller.ownerNameController,
                        labelText: ManagerStrings.ownerName,
                        keyboardType: TextInputType.name,
                      ),
                      mySizedBox(),
                      mainTextField(
                        controller: controller.ownerIdController,
                        labelText: ManagerStrings.ownerId,
                        maxLength: AppConstants.maxLengthOfIDNumber,
                      ),
                      mySizedBox(),
                      Row(
                        children: [
                          Expanded(
                            child: mainTextField(
                              controller: controller.vehicleNumberController,
                              labelText: ManagerStrings.vehicleNumber,
                              maxLength: AppConstants.maxLengthOfVehicleNumber,
                            ),
                          ),
                          SizedBox(width: ManagerWidth.w10),
                          Expanded(
                            child: mainTextField(
                              controller: controller.vehicleTypeController,
                              labelText: ManagerStrings.vehicleType,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          SizedBox(width: ManagerWidth.w10),
                          Expanded(
                            child: mainTextField(
                              controller: controller.vehicleColorController,
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
                              controller: controller.violationTimeController,
                              labelText: ManagerStrings.violationTime,
                              readOnly: true,
                            ),
                          ),
                          SizedBox(width: ManagerWidth.w10),
                          Expanded(
                            child: mainTextField(
                              controller: controller.violationDateController,
                              labelText: ManagerStrings.violationDate,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      mySizedBox(),
                      mainTextField(
                        controller: controller.placeOfViolationController,
                        labelText: ManagerStrings.placeOfViolation,
                        keyboardType: TextInputType.text,
                      ),
                      mySizedBox(),
                      mainTextField(
                        controller: controller.reasonForViolationController,
                        labelText: ManagerStrings.reasonForViolation,
                        keyboardType: TextInputType.text,
                      ),
                    ],
                  ),
                ),
                mainButton(
                  onPressed: () => controller.createViolation(),
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
      ),
    );
  }
}
