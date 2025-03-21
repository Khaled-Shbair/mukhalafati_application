import '/config/all_imports.dart';

Future<void> dialogOfCreateComplaint(BuildContext context) async {
  await showDialog(
    context: context,
    barrierColor: context.theme.dialogTheme.barrierColor,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.only(
          top: ManagerHeight.h60,
          bottom: ManagerHeight.h26,
          right: ManagerWidth.w20,
          left: ManagerWidth.w20,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),

        child: GetBuilder<CreateComplaintsController>(
          builder: (controller) {
            return Material(
              color: context.theme.unselectedWidgetColor,
              shadowColor: context.theme.unselectedWidgetColor,
              surfaceTintColor: context.theme.unselectedWidgetColor,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w18,
                    end: ManagerWidth.w18,
                    top: ManagerHeight.h10,
                    bottom: ManagerHeight.h20,
                  ),
                  children: [
                    CustomHeadOfOfficialPaper(),
                    verticalSpace(ManagerHeight.h15),
                    Divider(
                      color: context.theme.dividerTheme.color,
                      thickness: context.theme.dividerTheme.thickness,
                    ),
                    verticalSpace(ManagerHeight.h19),
                    CustomTextField(
                      controller: controller.complaintName,
                      labelText: ManagerStrings.fullName,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      validator: (v) => Validator.fullNameValidator(v),
                    ),
                    verticalSpace(ManagerHeight.h10),
                    CustomTextField(
                      validator: (v) =>
                          Validator.dateOfIncidentOrProblemValidator(v),
                      readOnly: true,
                      onTap: () async =>
                      await controller.selectDateTime(context),
                      controller: controller.dateOfComplaint,
                      labelText: ManagerStrings.dateOfIncidentOrProblem,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    verticalSpace(ManagerHeight.h10),
                    CustomTextField(
                      validator: (v) =>
                          Validator.addressOfIncidentOrProblemValidator(v),
                      controller: controller.addressOfComplaint,
                      labelText: ManagerStrings.address,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    verticalSpace(ManagerHeight.h10),
                    SizedBox(
                      height: ManagerHeight.h250,
                      child: CustomTextField(
                        validator: (v) =>
                            Validator.detailsOfComplaintValidator(v),
                        onEditingComplete: () =>
                            controller.createComplaintsButton(context),
                        controller: controller.detailOfComplaint,
                        hintText: ManagerStrings
                            .pleaseWriteTheDetailsOfTheComplaint,
                        keyboardType: TextInputType.text,
                        maxLines: AppConstants.maxLinesOfTextOfComplaint,
                        minLines: AppConstants.minLinesOfTextOfComplaint,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    verticalSpace(ManagerHeight.h28),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: CustomButton(
                            onPressed: () => controller.cancelButton(context),
                            backgroundColor: ManagerColors.antiFlashWhite,
                            side: BorderSide.none,
                            child: Text(
                              ManagerStrings.cancel,
                              style: context.textTheme
                                  .cancelCreateComplaintButtonAndCloseButton(
                                  context),
                            ),
                          ),
                        ),
                        horizontalSpace(ManagerWidth.w10),
                        Expanded(
                          flex: 3,
                          child: CustomButton(
                            onPressed: () =>
                                controller.createComplaintsButton(context),
                            // minWidth: ManagerWidth.w169,
                            side: BorderSide.none,
                            child: Text(
                              ManagerStrings.createComplaint,
                              style: context.textTheme
                                  .logoutAndCreateComplaintAndNameDriverButton(
                                  context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
