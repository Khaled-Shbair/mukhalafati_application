import '/config/all_imports.dart';

Future<void> confirmInformationDialog({
  required BuildContext context,
  required String text,
  String? textConfirmButton,
  String? textCancelButton,
  String? title,
  required Function() closeButton,
  Function()? confirmButton,
  Function()? cancelButton,
}) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: ManagerColors.black50,
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w42,
              end: ManagerWidth.w42,
            ),
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w5,
              top: ManagerHeight.h10,
              end: ManagerWidth.w5,
              bottom: ManagerHeight.h50,
            ),
            decoration: BoxDecoration(
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInConfirmInformationWidget,
                  spreadRadius: AppConstants
                      .spreadRadiusOfBoxShadowInConfirmInformationWidget,
                  color: ManagerColors.black25,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CustomButton(
                    onPressed: cancelButton ?? () => Get.back(),
                    shape: const CircleBorder(),
                    height: ManagerHeight.h24,
                    minWidth: ManagerWidth.w0,
                    child: Icon(
                      Icons.close,
                      color: ManagerColors.white,
                      size: ManagerIconsSizes.i18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w42,
                    end: ManagerWidth.w42,
                    bottom: ManagerHeight.h20,
                    top: ManagerHeight.h20,
                  ),
                  child: Text(
                    title ?? ManagerStrings.doYouWantToConfirmTheInformation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ManagerColors.eerieBlack,
                      fontWeight: ManagerFontWeight.semiBold,
                      fontFamily: ManagerFontFamily.cairo,
                      fontSize: ManagerFontsSizes.f20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w33,
                    end: ManagerWidth.w33,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        onPressed: cancelButton ?? () => Get.back(),
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        backgroundColor: ManagerColors.antiFlashWhite,
                        side: BorderSide.none,
                        child: Text(
                          textCancelButton ?? ManagerStrings.back,
                          style: TextStyle(
                            color: ManagerColors.darkGunmetal,
                            fontWeight: ManagerFontWeight.semiBold,
                            fontFamily: ManagerFontFamily.cairo,
                            fontSize: ManagerFontsSizes.f14,
                          ),
                        ),
                      ),
                      CustomButton(
                        onPressed: () async {
                          Get.back();
                          if (confirmButton != null) {
                            confirmButton();
                          }
                          await customCreatedSuccessfullyDialog(
                            context: context,
                            closeButton: closeButton,
                            text: text,
                          );
                        },
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        child: Text(
                          textConfirmButton ?? ManagerStrings.confirm,
                          style: TextStyle(
                            color: ManagerColors.white,
                            fontWeight: ManagerFontWeight.bold,
                            fontFamily: ManagerFontFamily.cairo,
                            fontSize: ManagerFontsSizes.f14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
