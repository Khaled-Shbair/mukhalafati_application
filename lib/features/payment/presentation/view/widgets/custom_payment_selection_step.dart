import '/config/all_imports.dart';

class CustomPaymentSelectionStep extends StatelessWidget {
  const CustomPaymentSelectionStep({
    required this.paymentSelectionButton,
    required this.selectJawwalPay,
    required this.selectPalPay,
    required this.selectVisaCard,
    required this.paymentSelectionDone,
    this.isVisaCard = false,
    this.isPalPay = false,
    this.isJawwalPay = false,
    super.key,
  });

  final Function() paymentSelectionButton;
  final Function() selectJawwalPay;
  final Function() selectPalPay;
  final Function() selectVisaCard;
  final bool paymentSelectionDone;
  final bool isVisaCard;

  final bool isPalPay;

  final bool isJawwalPay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ManagerStrings.choosePaymentMethod,
          style: context.textTheme.textStyleOfTitleOfStepOfPayment(context),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: ManagerWidth.w50,
            top: ManagerHeight.h6,
            bottom: ManagerHeight.h19,
          ),
          child: Text(
            ManagerStrings.subTitlePaymentMethod,
            style:
                context.textTheme.textStyleOfSubTitleOfStepOfPayment(context),
          ),
        ),
        CustomPaymentMethod(
          image: ManagerAssets.visaCard,
          name: ManagerStrings.visaCard,
          selected: isVisaCard,
          onTap: selectVisaCard,
        ),
        CustomPaymentMethod(
          image: ManagerAssets.palPay,
          name: ManagerStrings.palPay,
          selected: isPalPay,
          onTap: selectPalPay,
        ),
        CustomPaymentMethod(
          image: ManagerAssets.jawwalPay,
          name: ManagerStrings.jawwalPay,
          selected: isJawwalPay,
          onTap: selectJawwalPay,
        ),
        verticalSpace(ManagerHeight.h20),
        CustomButton(
          onPressed: paymentSelectionButton,
          child: Text(
            ManagerStrings.next,
            style: context.textTheme.textStyleOfButtonOfStepOfPayment(context),
          ),
        )
      ],
    );
  }
}
