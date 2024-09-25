import '/config/all_imports.dart';

Future<void> dialogOfCreateComplaint(context) async {
  await showDialog(
    context: context,
    barrierColor: ManagerColors.black50,
    barrierDismissible: false,
    builder: (context) {
      return Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w18,
          end: ManagerWidth.w18,
          top: ManagerHeight.h10,
          bottom: ManagerHeight.h26,
        ),
        margin: EdgeInsetsDirectional.only(
          top: ManagerHeight.h60,
          bottom: ManagerHeight.h60,
          start: ManagerWidth.w20,
          end: ManagerWidth.w20,
        ),
        decoration: BoxDecoration(
          color: ManagerColors.white,
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
        ),
        child: GetBuilder<CreateComplaintsController>(builder: (controller) {
          return Material(
            color: ManagerColors.transparent,
            shadowColor: ManagerColors.transparent,
            surfaceTintColor: ManagerColors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                headOfOfficialPaper(),
                SizedBox(height: ManagerHeight.h15),
                const Divider(
                  color: ManagerColors.black,
                  thickness: AppConstants.thicknessOfDividerInCreateViolation,
                  height: AppConstants.heightOfDividerInCreateViolation,
                ),
                SizedBox(height: ManagerHeight.h19),
                mainTextField(
                  controller: controller.textOfComplaint,
                  labelText: ManagerStrings.pleaseWriteTheDetailsOfTheComplaint,
                  fontSizeLabelText: ManagerFontsSizes.f12,
                  fontWeightLabelText: ManagerFontWeight.medium,
                  colorLabelText: ManagerColors.black50,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: ManagerHeight.h10),
                mainTextField(
                  controller: controller.textOfComplaint,
                  hintText: ManagerStrings.pleaseWriteTheDetailsOfTheComplaint,
                  fontSizeLabelText: ManagerFontsSizes.f12,
                  fontWeightLabelText: ManagerFontWeight.medium,
                  colorLabelText: ManagerColors.black50,
                  keyboardType: TextInputType.text,
                  maxLines: 20,
                ),
                SizedBox(height: ManagerHeight.h28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mainButton(
                      onPressed: () => controller.cancelButton(),
                      color: ManagerColors.antiFlashWhite,
                      minWidth: ManagerWidth.w122,
                      side: BorderSide.none,
                      child: Text(
                        ManagerStrings.cancel,
                        style: TextStyle(
                          color: ManagerColors.black,
                          fontWeight: ManagerFontWeight.semiBold,
                          fontSize: ManagerFontsSizes.f14,
                          fontFamily: ManagerFontFamily.cairo,
                        ),
                      ),
                    ),
                    mainButton(
                      onPressed: () => controller.createComplaintsButton(),
                      minWidth: ManagerWidth.w169,
                      side: BorderSide.none,
                      child: Text(
                        ManagerStrings.createComplaint,
                        style: TextStyle(
                          color: ManagerColors.white,
                          fontWeight: ManagerFontWeight.bold,
                          fontSize: ManagerFontsSizes.f14,
                          fontFamily: ManagerFontFamily.cairo,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        }),
      );
    },
  );
}
