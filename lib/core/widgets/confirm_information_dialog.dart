import '/config/all_imports.dart';

Future<void> customConfirmInformationDialog({
  required BuildContext context,
  required String text,
  String? textConfirmButton,
  String? textCancelButton,
  String? title,
  required Function() closeButton,
  required Function() confirmButton,
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
              color: context.theme.colorScheme.surface,
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
                    onPressed: cancelButton ?? () => context.pop(),
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
                    style: context.textTheme
                        .textStyleOfTitleOfCustomConfirmInformationDialog(
                            context),
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
                        onPressed: cancelButton ?? () => context.pop(),
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        backgroundColor:
                            context.theme.colorScheme.primaryContainer,
                        side: BorderSide.none,
                        child: Text(
                          textCancelButton ?? ManagerStrings.back,
                          style: context.textTheme
                              .textStyleOfBackButtonOfCustomConfirmInformationDialog(
                                  context),
                        ),
                      ),
                      CustomButton(
                        onPressed: confirmButton,
                        borderRadius: ManagerRadius.r8,
                        height: ManagerHeight.h40,
                        minWidth: ManagerWidth.w85,
                        child: Text(
                          textConfirmButton ?? ManagerStrings.confirm,
                          style: context.textTheme
                              .textStyleOfConfirmButtonOfCustomConfirmInformationDialog(
                                  context),
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
