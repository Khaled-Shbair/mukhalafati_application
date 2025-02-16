import '/config/all_imports.dart';

class CustomStatusPayment extends StatelessWidget {
  const CustomStatusPayment({
    required this.isSuccessful,
    required this.button,
    super.key,
  });

  final bool isSuccessful;
  final Function() button;

  @override
  Widget build(BuildContext context) {
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
          verticalSpace(ManagerHeight.h44),
          Text(
            isSuccessful
                ? ManagerStrings.paymentSuccessful
                : ManagerStrings.paymentFailed,
            style: context.textTheme.textStyleOfTitleOfStatusOfPayment(context),
          ),
          verticalSpace(ManagerHeight.h12),
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
              style: context.textTheme
                  .textStyleOfSubTitleOfStatusOfPayment(context),
            ),
          ),
          CustomButton(
            onPressed: button,
            child: Text(
              isSuccessful
                  ? ManagerStrings.backToViolations
                  : ManagerStrings.tryAgain,
              style:
                  context.textTheme.textStyleOfButtonOfStepOfPayment(context),
            ),
          ),
        ],
      ),
    );
  }
}
