import '/config/all_imports.dart';

Widget paymentConfirmationStep({
  required bool paymentConfirmationDone,
  required Function() paymentConfirmationButton,
  required Function() cancelButton,
  required String totalAmount,
  required String paymentMethod,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        ManagerStrings.paymentConfirmation,
        style: TextStyle(
          color: ManagerColors.black,
          fontSize: ManagerFontsSizes.f15,
          fontWeight: ManagerFontWeight.bold,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(
          end: ManagerWidth.w105,
          top: ManagerHeight.h6,
          bottom: ManagerHeight.h16,
        ),
        child: Text(
          ManagerStrings.subTitlePaymentConfirmation,
          style: TextStyle(
            color: ManagerColors.davyGrey,
            fontSize: ManagerFontsSizes.f13,
            fontWeight: ManagerFontWeight.medium,
            fontFamily: ManagerFontFamily.cairo,
            height: 2,
          ),
        ),
      ),
      Container(
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w15,
          end: ManagerWidth.w76,
          top: ManagerHeight.h15,
          bottom: ManagerHeight.h15,
        ),
        margin: EdgeInsetsDirectional.only(
          bottom: ManagerHeight.h20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
          border: Border.all(
            color: ManagerColors.primaryColor,
            width: ManagerWidth.w1,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ManagerStrings.totalAmount,
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f15,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontFamily: ManagerFontFamily.cairo,
                  ),
                ),
                Text(
                  '$totalAmount ${ManagerStrings.shekel}',
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f15,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontFamily: ManagerFontFamily.cairo,
                  ),
                ),
              ],
            ),
            SizedBox(height: ManagerHeight.h15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ManagerStrings.paymentMethod,
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f15,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontFamily: ManagerFontFamily.cairo,
                  ),
                ),
                Text(
                  paymentMethod,
                  style: TextStyle(
                    color: ManagerColors.black,
                    fontSize: ManagerFontsSizes.f15,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontFamily: ManagerFontFamily.cairo,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ManagerAssets.warningIcon,
            height: ManagerHeight.h24,
            width: ManagerWidth.w24,
          ),
          SizedBox(width: ManagerWidth.w4),
          SizedBox(
            width: ManagerWidth.w320,
            child: Text(
              ManagerStrings.afterClickingOnConfirmPayment,
              style: TextStyle(
                height: 2,
                color: ManagerColors.bittersweetShimmer,
                fontSize: ManagerFontsSizes.f14,
                fontWeight: ManagerFontWeight.medium,
                fontFamily: ManagerFontFamily.cairo,
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: ManagerHeight.h24),
      Row(
        children: [
          Expanded(
            child: mainButton(
              onPressed: cancelButton,
              color: ManagerColors.antiFlashWhite,
              side: BorderSide.none,
              child: Text(
                ManagerStrings.cancel,
                style: TextStyle(
                  color: ManagerColors.black,
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontsSizes.f15,
                ),
              ),
            ),
          ),
          SizedBox(width: ManagerWidth.w10),
          Expanded(
            flex: 2,
            child: mainButton(
              onPressed: paymentConfirmationButton,
              child: Text(
                ManagerStrings.paymentConfirmation,
                style: TextStyle(
                  color: ManagerColors.white,
                  fontFamily: ManagerFontFamily.cairo,
                  fontWeight: ManagerFontWeight.bold,
                  fontSize: ManagerFontsSizes.f15,
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
