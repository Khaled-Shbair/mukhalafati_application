import '/config/all_imports.dart';

Widget enterDetailsStep({
  required bool enterDetailsDone,
  required Function() completePaymentButton,
  required String paymentBy,
  required String price,
  required TextEditingController cardHolderName,
  required TextEditingController cardNumber,
  required TextEditingController securityCode,
  required TextEditingController expiryDateCard,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '${ManagerStrings.paymentDetailsBy} $paymentBy',
        style: TextStyle(
          color: ManagerColors.black,
          fontSize: ManagerFontsSizes.f15,
          fontWeight: ManagerFontWeight.bold,
          fontFamily: ManagerFontFamily.cairo,
        ),
      ),
      Padding(
        padding: EdgeInsetsDirectional.only(
          end: ManagerWidth.w122,
          top: ManagerHeight.h6,
          bottom: ManagerHeight.h19,
        ),
        child: Text(
          ManagerStrings.subTitlePaymentDetails,
          style: TextStyle(
            color: ManagerColors.davyGrey,
            fontSize: ManagerFontsSizes.f12,
            fontWeight: ManagerFontWeight.medium,
            fontFamily: ManagerFontFamily.cairo,
            height: 2,
          ),
        ),
      ),
      MainTextField(
        controller: cardHolderName,
        labelText: ManagerStrings.cardHolderName,
        keyboardType: TextInputType.name,
      ),
      SizedBox(height: ManagerHeight.h24),
      MainTextField(
        controller: cardNumber,
        labelText: ManagerStrings.cardNumber,
        maxLength: AppConstants.maxLengthOfCardNumber,
      ),
      SizedBox(height: ManagerHeight.h24),
      Row(
        children: [
          Expanded(
            flex: 2,
            child: MainTextField(
              controller: expiryDateCard,
              labelText: ManagerStrings.expiryDateCard,
              keyboardType: TextInputType.text,
              maxLength: AppConstants.maxLengthOfExpiryDateCard,
            ),
          ),
          SizedBox(width: ManagerWidth.w10),
          Expanded(
            child: MainTextField(
              controller: securityCode,
              labelText: ManagerStrings.securityCode,
              maxLength: AppConstants.maxLengthOfSecurityCode,
            ),
          ),
        ],
      ),
      SizedBox(height: ManagerHeight.h30),
      mainButton(
        onPressed: completePaymentButton,
        child: Text(
          '${ManagerStrings.completePaymentBy} $price₪',
          style: TextStyle(
            color: ManagerColors.white,
            fontFamily: ManagerFontFamily.cairo,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f15,
          ),
        ),
      )
    ],
  );
}
