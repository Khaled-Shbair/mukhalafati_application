import '/config/all_imports.dart';

Future<void> customCreatedSuccessfullyDialog({
  required void Function() closeButton,
  required BuildContext context,
  required String text,
  double? startPaddingText,
  double? endPaddingText,
}) async {
  await showDialog(
    context: context,
    barrierColor: context.theme.colorScheme.surface,
    barrierDismissible: false,
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
              end: ManagerWidth.w18,
              bottom: ManagerHeight.h24,
              top: ManagerHeight.h10,
            ),
            decoration: BoxDecoration(
              color: context.theme.dialogTheme.backgroundColor,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                  spreadRadius: AppConstants
                      .spreadRadiusOfBoxShadowInCreatedSuccessfullyWidget,
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInCreatedSuccessfullyWidget,
                  color: context.theme.dialogTheme.shadowColor!,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    CustomButton(
                      onPressed: closeButton,
                      shape: const CircleBorder(),
                      height: ManagerHeight.h24,
                      minWidth: ManagerWidth.w0,
                      child: Icon(
                        Icons.close,
                        color: context.theme.iconTheme.color,
                        size: context.theme.iconTheme.size,
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.center,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                          top: ManagerHeight.h20,
                        ),
                        child: SvgPicture.asset(
                          ManagerAssets.createdSuccessfully,
                          height: ManagerHeight.h120,
                          width: ManagerWidth.w120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsetsDirectional.only(
                    start: startPaddingText ?? ManagerWidth.w38,
                    end: endPaddingText ?? ManagerWidth.w38,
                    top: ManagerHeight.h20,
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: context.theme.dialogTheme.titleTextStyle,
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
