import '/config/all_imports.dart';

Future<void> createdSuccessfullyDialog({
  required void Function() closeButton,
  required BuildContext context,
}) async {
  await showDialog(
    context: context,
    barrierColor: ManagerColors.white,
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
              color: ManagerColors.white,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                  spreadRadius: AppConstants
                      .spreadRadiusOfBoxShadowInCreatedSuccessfullyWidget,
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInCreatedSuccessfullyWidget,
                  color: ManagerColors.black5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    mainButton(
                      onPressed: closeButton,
                      shape: const CircleBorder(),
                      height: ManagerHeight.h24,
                      minWidth: ManagerWidth.w0,
                      child: Icon(
                        Icons.close,
                        color: ManagerColors.white,
                        size: ManagerIconsSizes.r18,
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
                    start: ManagerWidth.w38,
                    end: ManagerWidth.w38,
                    top: ManagerHeight.h20,
                  ),
                  child: Text(
                    ManagerStrings.theViolationWasSuccessfullyCreated,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ManagerColors.eerieBlack,
                      fontSize: ManagerFontsSizes.f20,
                      fontFamily: ManagerFontFamily.cairo,
                      fontWeight: ManagerFontWeight.semiBold,
                      decoration: TextDecoration.none,
                    ),
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
