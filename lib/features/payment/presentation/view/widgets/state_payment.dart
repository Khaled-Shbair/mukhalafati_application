import '/config/all_imports.dart';

Widget statePayment({required bool isSuccessful, required Function() button}) {
  return Padding(
    padding: EdgeInsetsDirectional.only(
      start: ManagerWidth.w20,
      end: ManagerWidth.w20,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isSuccessful
            ? SvgPicture.asset(
                ManagerAssets.createdSuccessfully,
                height: ManagerHeight.h186,
                width: ManagerWidth.w186,
              )
            : Image.asset(
                ManagerAssets.inputIncorrect,
                height: ManagerHeight.h186,
                width: ManagerWidth.w186,
              ),
        SizedBox(height: ManagerHeight.h44),
        Text(
          isSuccessful
              ? ManagerStrings.paymentSuccessful
              : ManagerStrings.paymentFailed,
          style: TextStyle(
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
              fontSize: ManagerFontsSizes.f20,
              fontWeight: ManagerFontWeight.bold,
              decoration: TextDecoration.none),
        ),
        SizedBox(height: ManagerHeight.h12),
        Padding(
          padding: EdgeInsetsDirectional.only(
            start: ManagerWidth.w20,
            end: ManagerWidth.w20,
            bottom: ManagerHeight.h44,
          ),
          child: Text(
            isSuccessful
                ? ManagerStrings.subTitlePaymentSuccessful
                : ManagerStrings.subTitlePaymentFailed,
            textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              color: ManagerColors.black,
              fontFamily: ManagerFontFamily.cairo,
              fontSize: ManagerFontsSizes.f18,
              fontWeight: ManagerFontWeight.semiBold,
            ),
          ),
        ),
        mainButton(
          onPressed: button,
          child: Text(
            isSuccessful
                ? ManagerStrings.backToViolations
                : ManagerStrings.tryAgain,
            style: TextStyle(
              color: ManagerColors.white,
              fontFamily: ManagerFontFamily.cairo,
              fontSize: ManagerFontsSizes.f16,
              fontWeight: ManagerFontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
