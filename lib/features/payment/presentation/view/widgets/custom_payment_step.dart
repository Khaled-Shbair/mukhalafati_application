import '/config/all_imports.dart';

class CustomPaymentStep extends StatelessWidget {
  const CustomPaymentStep({
    required this.isFirstStep,
    required this.isSecondStep,
    required this.isThirdStep,
    super.key,
  });

  final bool isFirstStep;
  final bool isSecondStep;
  final bool isThirdStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: ManagerWidth.w15,
        end: ManagerWidth.w15,
        bottom: ManagerHeight.h5,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: ManagerRadius.r17,
            backgroundColor: context.theme.primaryColor,
            child: Text(
              AppConstants.one,
              style: context.textTheme
                  .textStyleOfNumberOfStepOfPayment(context, true),
            ),
          ),
          Expanded(
            child: Divider(
              color: isFirstStep
                  ? context.theme.colorScheme.onTertiary
                  : context.theme.primaryColor,
              thickness: ManagerHeight.h3,
            ),
          ),
          CircleAvatar(
            radius: ManagerRadius.r17,
            backgroundColor: isSecondStep || isThirdStep
                ? context.theme.primaryColor
                : context.theme.colorScheme.onTertiary,
            child: Text(
              AppConstants.two,
              style: context.textTheme.textStyleOfNumberOfStepOfPayment(
                  context, isSecondStep || isThirdStep),
            ),
          ),
          Expanded(
            child: Divider(
              color: isThirdStep
                  ? context.theme.primaryColor
                  : context.theme.colorScheme.onTertiary,
              thickness: ManagerHeight.h3,
            ),
          ),
          CircleAvatar(
            radius: ManagerRadius.r17,
            backgroundColor: isThirdStep
                ? context.theme.primaryColor
                : context.theme.colorScheme.onTertiary,
            child: Text(
              AppConstants.three,
              style: context.textTheme
                  .textStyleOfNumberOfStepOfPayment(context, isThirdStep),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNameOfPaymentStep extends StatelessWidget {
  const CustomNameOfPaymentStep({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          ManagerStrings.paymentSelection,
          style: context.textTheme
              .textStyleOfNameOfStepOfPayment(context),
        ),
        Text(
          ManagerStrings.paymentMethod,
          style: context.textTheme
              .textStyleOfNameOfStepOfPayment(context),
        ),
        Text(
          ManagerStrings.paymentConfirmation,
          style: context.textTheme
              .textStyleOfNameOfStepOfPayment(context),
        ),
      ],
    );
  }
}
