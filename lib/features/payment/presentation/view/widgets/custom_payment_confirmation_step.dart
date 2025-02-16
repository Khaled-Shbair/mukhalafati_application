import '/config/all_imports.dart';

class CustomPaymentConfirmationStep extends StatelessWidget {
  const CustomPaymentConfirmationStep(
      {required this.paymentConfirmationDone,
      required this.paymentConfirmationButton,
      required this.cancelButton,
      required this.totalAmount,
      required this.paymentMethod,
      super.key});

  final bool paymentConfirmationDone;
  final Function() paymentConfirmationButton;
  final Function() cancelButton;
  final String totalAmount;
  final String paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ManagerStrings.paymentConfirmation,
          style: context.textTheme.textStyleOfTitleOfStepOfPayment(context),
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
            end: ManagerWidth.w105,
            top: ManagerHeight.h6,
            bottom: ManagerHeight.h16,
          ),
          child: Text(
            ManagerStrings.subTitlePaymentConfirmation,
            style:
                context.textTheme.textStyleOfSubTitleOfStepOfPayment(context),
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
              color: context.theme.primaryColor,
              width: ManagerWidth.w1,
            ),
          ),
          child: Column(
            children: [
              _DetailsOfConfirmationPayment(
                title: ManagerStrings.totalAmount,
                subTitle: totalAmount,
              ),
              verticalSpace(ManagerHeight.h15),
              _DetailsOfConfirmationPayment(
                title: ManagerStrings.paymentMethod,
                subTitle: paymentMethod,
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
            horizontalSpace(ManagerWidth.w4),
            SizedBox(
              width: ManagerWidth.w320,
              child: Text(
                ManagerStrings.afterClickingOnConfirmPayment,
                style: context.textTheme
                    .textStyleOfWarningInConfirmationPayment(context),
              ),
            ),
          ],
        ),
        verticalSpace(ManagerHeight.h24),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed: cancelButton,
                backgroundColor: context.theme.colorScheme.primaryContainer,
                side: BorderSide.none,
                child: Text(
                  ManagerStrings.cancel,
                  style: context.textTheme
                      .textStyleOfCancelPayButtonOfStepOfPayment(context),
                ),
              ),
            ),
            horizontalSpace(ManagerWidth.w10),
            Expanded(
              flex: 2,
              child: CustomButton(
                onPressed: paymentConfirmationButton,
                child: Text(
                  ManagerStrings.paymentConfirmation,
                  style: context.textTheme
                      .textStyleOfButtonOfStepOfPayment(context),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DetailsOfConfirmationPayment extends StatelessWidget {
  const _DetailsOfConfirmationPayment({
    required this.subTitle,
    required this.title,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme
              .textStyleOfDetailsOfConfirmationPayment(context),
        ),
        Text(
          '$subTitle ${ManagerStrings.shekel}',
          style: context.textTheme
              .textStyleOfDetailsOfConfirmationPayment(context),
        ),
      ],
    );
  }
}
