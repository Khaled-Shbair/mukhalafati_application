import '/config/all_imports.dart';

Future<void> confirmInformationDialog({
  required BuildContext context,
}) async {
  await showDialog(
    context: Get.context!,
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
                  child: mainButton(
                    onPressed: () => Get.back(),
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
                    ManagerStrings.doYouWantToConfirmTheInformation,
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
                      mainButton(
                        onPressed: () => Get.back(),
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        color: ManagerColors.antiFlashWhite,
                        side: BorderSide.none,
                        child: Text(
                          ManagerStrings.back,
                          style: TextStyle(
                            color: ManagerColors.darkGunmetal,
                            fontWeight: ManagerFontWeight.semiBold,
                            fontFamily: ManagerFontFamily.cairo,
                            fontSize: ManagerFontsSizes.f14,
                          ),
                        ),
                      ),
                      mainButton(
                        onPressed: () async {
                          Get.back();
                          await createdSuccessfullyDialog(
                            context: context,
                            closeButton: () =>
                                Get.offAllNamed(Routes.policeManHomeScreen),
                          );
                        },
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        child: Text(
                          ManagerStrings.confirm,
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
