import '/config/all_imports.dart';

class PoliceManHomeScreen extends StatelessWidget {
  const PoliceManHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoliceManHomeController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          resizeToAvoidBottomInset: false,
          appBar: customHomeAppBar(
            context: context,
            firstName: controller.policeFirstName,
            openEndDrawer: () => controller.openEndDrawer(),
            welcome: controller.welcome,
            widget: Container(
              height: ManagerHeight.h50,
              width: ManagerWidth.w50,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(ManagerRadius.r5),
                image: DecorationImage(
                  image:
                      customCachedNetworkImageProvider(controller.policeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          endDrawer: PoliceManDrawer(isPoliceManHomeScreen: true),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w19,
              end: ManagerWidth.w19,
              top: ManagerHeight.h26,
              bottom: ManagerHeight.h30,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomButtonForViolationDistributionPages(
                        text: ManagerStrings.weeklyViolations,
                        isSelected: controller.isSelectedButtonWeeklyViolations,
                        onTap: () => controller.buttonWeeklyViolations(),
                      ),
                    ),
                    horizontalSpace(ManagerWidth.w11),
                    Expanded(
                      child: CustomButtonForViolationDistributionPages(
                        text: ManagerStrings.monthlyViolations,
                        isSelected:
                            controller.isSelectedButtonMonthlyViolations,
                        onTap: () => controller.buttonMonthlyViolations(),
                      ),
                    ),
                  ],
                ),
                verticalSpace(ManagerHeight.h28),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) => controller.onPageChanged(value),
                    children: [
                      CustomPageViewItem(
                        highestViolations: controller.highestViolationsInWeek,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: true,
                        barChart: CustomBarChartDistribution(
                          tooltipBehavior: controller.tooltipBehavior,
                          dataSource: [
                            ...List.generate(
                              controller.weeklyViolations.length,
                              (index) => controller.weeklyViolations[index],
                            ),
                          ],
                        ),
                      ),
                      CustomPageViewItem(
                        highestViolations: controller.highestViolationsInMonth,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: false,
                        barChart: CustomBarChartDistribution(
                          tooltipBehavior: controller.tooltipBehavior,
                          dataSource: [
                            ...List.generate(
                              controller.monthlyViolations.length,
                              (index) => controller.monthlyViolations[index],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
