import '/config/all_imports.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    required this.priceOfViolation,
    required this.violationId,
    super.key,
  });

  final String priceOfViolation;
  final int violationId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          endDrawer: CustomDriverDrawer(isPayViolationsScreen: true),
          appBar: AppBar(
            title: Text(ManagerStrings.payViolations),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => controller.backButton(context),
            ),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h32,
            ),
            child: Column(
              children: [
                Padding(
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
                          color: controller.isFirstPage()
                              ? context.theme.colorScheme.onTertiary
                              : context.theme.primaryColor,
                          thickness: ManagerHeight.h3,
                        ),
                      ),
                      CircleAvatar(
                        radius: ManagerRadius.r17,
                        backgroundColor:
                            controller.isTwoPage() || controller.isThreePage()
                                ? context.theme.primaryColor
                                : context.theme.colorScheme.onTertiary,
                        child: Text(
                          AppConstants.two,
                          style: context.textTheme
                              .textStyleOfNumberOfStepOfPayment(
                                  context,
                                  controller.isTwoPage() ||
                                      controller.isThreePage()),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: controller.isThreePage()
                              ? context.theme.primaryColor
                              : context.theme.colorScheme.onTertiary,
                          thickness: ManagerHeight.h3,
                        ),
                      ),
                      CircleAvatar(
                        radius: ManagerRadius.r17,
                        backgroundColor: controller.isThreePage()
                            ? context.theme.primaryColor
                            : context.theme.colorScheme.onTertiary,
                        child: Text(
                          AppConstants.three,
                          style: context.textTheme
                              .textStyleOfNumberOfStepOfPayment(
                                  context, controller.isThreePage()),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
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
                ),
                verticalSpace(ManagerHeight.h34),
                if (controller.loading) ...{
                  CustomLoading(),
                } else ...{
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: controller.pageController,
                      onPageChanged: (value) =>
                          controller.changeCurrentPage(value),
                      children: [
                        CustomPaymentSelectionStep(
                          paymentSelectionButton: () =>
                              controller.paymentSelectionButton(context),
                          paymentSelectionDone: controller.paymentSelectionDone,
                          selectJawwalPay: () => controller.selectJawwalPay(),
                          selectPalPay: () => controller.selectPalPay(),
                          selectVisaCard: () => controller.selectVisaCard(),
                          isJawwalPay: controller.isJawwalPay,
                          isPalPay: controller.isPalPay,
                          isVisaCard: controller.isVisaCard,
                        ),
                        CustomEnterDetailsStep(
                          formKey: controller.formKey,
                          enterDetailsDone: controller.enterDetailsDone,
                          completePaymentButton: () =>
                              controller.completePaymentButton(context),
                          paymentBy: controller.paymentBy,
                          price: priceOfViolation,
                          cardHolderName: controller.cardHolderName,
                          cardNumber: controller.cardNumber,
                          expiryDateCard: controller.expiryDateCard,
                          securityCode: controller.securityCode,
                        ),
                        CustomPaymentConfirmationStep(
                          paymentConfirmationDone:
                              controller.paymentConfirmationDone,
                          paymentConfirmationButton: () =>
                              controller.paymentConfirmationButton(violationId),
                          totalAmount: priceOfViolation,
                          paymentMethod: controller.paymentBy,
                          cancelButton: () => controller.cancelButton(context),
                        ),
                      ],
                    ),
                  ),
                },
              ],
            ),
          ),
        );
      },
    );
  }
}
