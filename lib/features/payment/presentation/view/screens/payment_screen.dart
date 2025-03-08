
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
                CustomPaymentStep(
                  isFirstStep: controller.isFirstPage(),
                  isSecondStep: controller.isTwoPage(),
                  isThirdStep: controller.isThreePage(),
                ),
                CustomNameOfPaymentStep(),
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
