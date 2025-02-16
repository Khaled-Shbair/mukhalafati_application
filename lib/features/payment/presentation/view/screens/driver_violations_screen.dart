import '/config/all_imports.dart';

class DriverViolationsScreen extends StatelessWidget {
  const DriverViolationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DriverViolationsController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          endDrawer: CustomDriverDrawer(isPayViolationsScreen: true),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(ManagerStrings.payViolations),
            actions: [
              CustomMenuButton(() => controller.openEndDrawer()),
            ],
          ),
          body: Container(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w20,
              end: ManagerWidth.w20,
              top: ManagerHeight.h20,
              bottom: ManagerHeight.h20,
            ),
            margin: EdgeInsetsDirectional.only(
              start: ManagerWidth.w24,
              end: ManagerWidth.w24,
              top: ManagerHeight.h28,
              bottom: ManagerHeight.h40,
            ),
            decoration: BoxDecoration(
              color: context.theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(ManagerRadius.r5),
              boxShadow: [
                BoxShadow(
                  color: context.theme.colorScheme.shadow,
                  blurRadius: AppConstants
                      .blurRadiusOfBoxShadowInViolationPaymentScreen,
                  spreadRadius: AppConstants
                      .spreadRadiusOfBoxShadowInViolationPaymentScreen,
                  offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ManagerStrings.yourViolations,
                  style: context.textTheme
                      .textStyleOfTitleDriverViolationsScreen(),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                    end: ManagerWidth.w85,
                    bottom: ManagerHeight.h20,
                  ),
                  child: Text(
                    ManagerStrings.youCanViewAllYourPaidAndUnpaidViolations,
                    style: context.textTheme
                        .textStyleOfSubTitleDriverViolationsScreen(),
                  ),
                ),
                CustomFilterViolationsButton(
                  isPaid: controller.paid,
                  isUnPaid: controller.unPaid,
                  isLatestDate: controller.latestDate,
                  isOldestDate: controller.oldestDate,
                  isMaximumAmount: controller.maximumAmount,
                  isMinimumAmount: controller.minimumAmount,
                  selectPaidFilter: controller.selectPaidFilter,
                  selectUnPaidFilter: controller.selectUnPaidFilter,
                  selectLatestDateFilter: controller.selectLatestDateFilter,
                  selectOldestDateFilter: controller.selectOldestDateFilter,
                  selectMaximumAmountFilter:
                      controller.selectMaximumAmountFilter,
                  selectMinimumAmountFilter:
                      controller.selectMinimumAmountFilter,
                  cancelFilterButton: controller.cancelFilterButton,
                ),
                if (controller.loading == true &&
                    controller.viewViolations.isEmpty) ...{
                  SizedBox(
                    height: ManagerHeight.h154,
                    child: CustomLoading(),
                  ),
                } else if (controller.viewViolations.isNotEmpty &&
                    controller.loading == false) ...{
                  CustomTableOfViolations(
                    namesOfColumns: controller.namesOfColumns,
                    scrollController: controller.scrollController,
                    viewViolations: controller.viewViolations,
                    onTap: controller.showViolationButton,
                  ),
                } else ...{
                  CustomEmptyTable(
                    length: controller.namesOfColumns.length,
                    nameOfColumns: controller.namesOfColumns,
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
