import '/config/all_imports.dart';

class CreateViolationScreen extends StatelessWidget {
  const CreateViolationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateViolationController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          endDrawer: CustomPoliceManDrawer(isCreateViolationScreen: true),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.createViolation),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
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
                    color: context.theme.colorScheme.outline,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  child: Column(
                    children: [
                      CustomHeadOfOfficialPaper(),
                      verticalSpace(ManagerHeight.h15),
                      Divider(
                        color: context.theme.dividerTheme.color,
                        thickness: context.theme.dividerTheme.thickness,
                        height: context.theme.dividerTheme.space,
                      ),
                      verticalSpace(ManagerHeight.h19),
                      CustomTextField(
                        controller: controller.driverName,
                        labelText: ManagerStrings.driverName,
                        keyboardType: TextInputType.name,
                        validator: (v) => Validator.fullNameValidator(v),
                      ),
                      verticalSpace(ManagerHeight.h10),
                      CustomTextField(
                        validator: (v) => Validator.idNumberValidator(v),
                        controller: controller.driverIdNumber,
                        labelText: ManagerStrings.driverId,
                        maxLength: AppConstants.maxLengthOfIDNumber,
                      ),
                      verticalSpace(ManagerHeight.h10),
                      CustomTextField(
                        validator: (v) => Validator.fullNameValidator(v),
                        controller: controller.ownerName,
                        labelText: ManagerStrings.ownerName,
                        keyboardType: TextInputType.name,
                      ),
                      verticalSpace(ManagerHeight.h10),
                      CustomTextField(
                        validator: (v) => Validator.idNumberValidator(v),
                        controller: controller.ownerId,
                        labelText: ManagerStrings.ownerId,
                        maxLength: AppConstants.maxLengthOfIDNumber,
                      ),
                      verticalSpace(ManagerHeight.h10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller.vehicleNumber,
                              labelText: ManagerStrings.vehicleNumber,
                              maxLength: AppConstants.maxLengthOfVehicleNumber,
                              validator: (v) =>
                                  Validator.vehicleNumberValidator(v),
                            ),
                          ),
                          horizontalSpace(ManagerWidth.w10),
                          Expanded(
                            child: CustomTextField(
                              controller: controller.vehicleType,
                              labelText: ManagerStrings.vehicleType,
                              keyboardType: TextInputType.text,
                              validator: (v) =>
                                  Validator.vehicleTypeValidator(v),
                            ),
                          ),
                          horizontalSpace(ManagerWidth.w10),
                          Expanded(
                            child: CustomTextField(
                              validator: (v) =>
                                  Validator.vehicleColorValidator(v),
                              controller: controller.vehicleColor,
                              labelText: ManagerStrings.vehicleColor,
                              keyboardType: TextInputType.text,
                              maxLength: AppConstants.maxLengthOfVehicleColor,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(ManagerHeight.h10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              controller: controller.violationTime,
                              labelText: ManagerStrings.violationTime,
                              readOnly: true,
                            ),
                          ),
                          horizontalSpace(ManagerWidth.w10),
                          Expanded(
                            child: CustomTextField(
                              controller: controller.violationDate,
                              labelText: ManagerStrings.violationDate,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(ManagerHeight.h10),
                      CustomTextField(
                        controller: controller.placeOfViolation,
                        labelText: ManagerStrings.placeOfViolation,
                        keyboardType: TextInputType.text,
                        validator: (v) =>
                            Validator.placeOfViolationValidator(v),
                      ),
                      verticalSpace(ManagerHeight.h10),
                      CustomSearchDropDown(
                        validator: (v) =>
                            Validator.reasonOfViolationValidator(v),
                        selectedItem: controller.reasonOfViolation,
                        items:
                            controller.allReasons.map((e) => e.reason).toList(),
                        labelText: ManagerStrings.reasonForViolation,
                        labelStyle:
                            context.theme.inputDecorationTheme.labelStyle,
                        onChangedFunction: controller.changeReasonOfViolation,
                      ),
                    ],
                  ),
                ),
                CustomButton(
                  onPressed: () => controller.createViolation(context),
                  child: Text(
                    ManagerStrings.createViolation,
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
