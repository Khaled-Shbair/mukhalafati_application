import '/config/all_imports.dart';

Widget paymentSelectionStep({
  required Function() paymentSelectionButton,
  required Function() selectJawwalPay,
  required Function() selectPalPay,
  required Function() selectVisaCard,
  required bool paymentSelectionDone,
  bool isVisaCard = false,
  bool isPalPay = false,
  bool isJawwalPay = false,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        ManagerStrings.choosePaymentMethod,
        style: TextStyle(
          color: ManagerColors.black,
          fontSize: ManagerFontsSizes.f15,
          fontWeight: ManagerFontWeight.bold,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(
          end: ManagerWidth.w50,
          top: ManagerHeight.h6,
          bottom: ManagerHeight.h19,
        ),
        child: Text(
          ManagerStrings.subTitlePaymentMethod,
          style: TextStyle(
            color: ManagerColors.davyGrey,
            fontSize: ManagerFontsSizes.f12,
            fontWeight: ManagerFontWeight.medium,
            fontFamily: ManagerFontFamily.cairo,
            height: 2,
          ),
        ),
      ),
      paymentMethod(
        image: ManagerAssets.visaCard,
        name: ManagerStrings.visaCard,
        selected: isVisaCard,
        onTap: selectVisaCard,
      ),
      paymentMethod(
        image: ManagerAssets.palPay,
        name: ManagerStrings.palPay,
        selected: isPalPay,
        onTap: selectPalPay,
      ),
      paymentMethod(
        image: ManagerAssets.jawwalPay,
        name: ManagerStrings.jawwalPay,
        selected: isJawwalPay,
        onTap: selectJawwalPay,
      ),
      SizedBox(height: ManagerHeight.h20),
      CustomButton(
        onPressed: paymentSelectionButton,
        child: Text(
          ManagerStrings.next,
          style: TextStyle(
            color: ManagerColors.white,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f16,
          ),
        ),
      )
    ],
  );
}
