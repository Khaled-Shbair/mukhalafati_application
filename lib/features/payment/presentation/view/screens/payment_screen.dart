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
              onPressed: () => controller.backButton(),
            ),
            actions: [
              menuButton(() => controller.openEndDrawer()),
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
                      bottom: ManagerHeight.h5),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: ManagerRadius.r17,
                        backgroundColor: ManagerColors.primaryColor,
                        child: Text(
                          AppConstants.one,
                          style: TextStyle(
                            fontFamily: ManagerFontFamily.cairo,
                            fontWeight: ManagerFontWeight.bold,
                            fontSize: ManagerFontsSizes.f16,
                            color: ManagerColors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: controller.isFirstPage()
                              ? ManagerColors.lightSilver40
                              : ManagerColors.primaryColor,
                          thickness: ManagerHeight.h3,
                        ),
                      ),
                      CircleAvatar(
                        radius: ManagerRadius.r17,
                        backgroundColor:
                            controller.isTwoPage() || controller.isThreePage()
                                ? ManagerColors.primaryColor
                                : ManagerColors.lightSilver40,
                        child: Text(
                          AppConstants.two,
                          style: TextStyle(
                            fontFamily: ManagerFontFamily.cairo,
                            fontWeight: ManagerFontWeight.bold,
                            fontSize: ManagerFontsSizes.f16,
                            color: controller.isTwoPage() ||
                                    controller.isThreePage()
                                ? ManagerColors.white
                                : ManagerColors.black,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: controller.isThreePage()
                              ? ManagerColors.primaryColor
                              : ManagerColors.lightSilver40,
                          thickness: ManagerHeight.h3,
                        ),
                      ),
                      CircleAvatar(
                        radius: ManagerRadius.r17,
                        backgroundColor: controller.isThreePage()
                            ? ManagerColors.primaryColor
                            : ManagerColors.lightSilver40,
                        child: Text(
                          AppConstants.three,
                          style: TextStyle(
                            fontFamily: ManagerFontFamily.cairo,
                            fontWeight: ManagerFontWeight.bold,
                            fontSize: ManagerFontsSizes.f16,
                            color: controller.isThreePage()
                                ? ManagerColors.white
                                : ManagerColors.black,
                          ),
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
                      style: TextStyle(
                        color: ManagerColors.black,
                        fontSize: ManagerFontsSizes.f12,
                        fontWeight: ManagerFontWeight.semiBold,
                        fontFamily: ManagerFontFamily.cairo,
                      ),
                    ),
                    Text(
                      ManagerStrings.paymentMethod,
                      style: TextStyle(
                        color: ManagerColors.black,
                        fontSize: ManagerFontsSizes.f12,
                        fontWeight: ManagerFontWeight.semiBold,
                        fontFamily: ManagerFontFamily.cairo,
                      ),
                    ),
                    Text(
                      ManagerStrings.paymentConfirmation,
                      style: TextStyle(
                        color: ManagerColors.black,
                        fontSize: ManagerFontsSizes.f12,
                        fontWeight: ManagerFontWeight.semiBold,
                        fontFamily: ManagerFontFamily.cairo,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h34),
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
                        paymentSelectionStep(
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
                        enterDetailsStep(
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
                        paymentConfirmationStep(
                          paymentConfirmationDone:
                              controller.paymentConfirmationDone,
                          paymentConfirmationButton: () =>
                              controller.paymentConfirmationButton(violationId),
                          totalAmount: priceOfViolation,
                          paymentMethod: controller.paymentBy,
                          cancelButton: () => controller.cancelButton(),
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
