import '/config/all_imports.dart';

class CustomEnterDetailsStep extends StatelessWidget {
  const CustomEnterDetailsStep({
    required this.enterDetailsDone,
    required this.completePaymentButton,
    required this.paymentBy,
    required this.price,
    required this.cardHolderName,
    required this.cardNumber,
    required this.securityCode,
    required this.expiryDateCard,
    required this.formKey,
    super.key,
  });

  final bool enterDetailsDone;
  final Function() completePaymentButton;
  final String paymentBy;
  final String price;
  final TextEditingController cardHolderName;
  final TextEditingController cardNumber;
  final TextEditingController securityCode;
  final TextEditingController expiryDateCard;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${ManagerStrings.paymentDetailsBy} $paymentBy',
              style: context.textTheme.textStyleOfTitleOfStepOfPayment(context),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: ManagerWidth.w122,
                top: ManagerHeight.h6,
                bottom: ManagerHeight.h19,
              ),
              child: Text(
                ManagerStrings.subTitlePaymentDetails,
                style:
                    context.textTheme.textStyleOfSubTitleOfStepOfPayment(context),
              ),
            ),
            CustomTextField(
              controller: cardHolderName,
              labelText: ManagerStrings.cardHolderName,
              keyboardType: TextInputType.name,
              validator: (v) => Validator.cardHolderNameValidator(v),
            ),
            verticalSpace(ManagerHeight.h24),
            CustomTextField(
              controller: cardNumber,
              labelText: ManagerStrings.cardNumber,
              maxLength: AppConstants.maxLengthOfCardNumber,
              validator: (v) => Validator.cardNumberValidator(v),
            ),
            verticalSpace(ManagerHeight.h24),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CustomTextField(
                    controller: expiryDateCard,
                    labelText: ManagerStrings.expiryDateCard,
                    keyboardType: TextInputType.text,
                    maxLength: AppConstants.maxLengthOfExpiryDateCard,
                    validator: (v) => Validator.expiryDateCardValidator(v),
                  ),
                ),
                horizontalSpace(ManagerWidth.w10),
                Expanded(
                  child: CustomTextField(
                    controller: securityCode,
                    labelText: ManagerStrings.securityCode,
                    maxLength: AppConstants.maxLengthOfSecurityCode,
                    validator: (v) => Validator.securityCodeValidator(v),
                  ),
                ),
              ],
            ),
            verticalSpace(ManagerHeight.h30),
            CustomButton(
              onPressed: completePaymentButton,
              child: Text(
                '${ManagerStrings.completePaymentBy} $price₪',
                style:
                    context.textTheme.textStyleOfButtonOfStepOfPayment(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
