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
          appBar: homeAppBar(
            firstName: controller.policeFirstName,
            openEndDrawer: () => controller.openEndDrawer(),
            welcome: controller.welcome,
            widget: Container(
              height: ManagerHeight.h50,
              width: ManagerWidth.w50,
              decoration: BoxDecoration(
                color: ManagerColors.primaryColor,
                borderRadius: BorderRadius.circular(ManagerRadius.r5),
                image: DecorationImage(
                  // image: NetworkImage(controller.policeImage),
                  image: AssetImage(controller.policeImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          endDrawer: policeManDrawer(
            isPoliceManHomeScreen: true,
            policeName: controller.policeName,
            policeImage: controller.policeImage,
          ),
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
                      child: buttonForViolationDistributionPages(
                        text: ManagerStrings.weeklyViolations,
                        isSelected: controller.isSelectedButtonWeeklyViolations,
                        onTap: () => controller.buttonWeeklyViolations(),
                      ),
                    ),
                    SizedBox(width: ManagerWidth.w11),
                    Expanded(
                      child: buttonForViolationDistributionPages(
                        text: ManagerStrings.monthlyViolations,
                        isSelected:
                            controller.isSelectedButtonMonthlyViolations,
                        onTap: () => controller.buttonMonthlyViolations(),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h28),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) => controller.onPageChanged(value),
                    children: [
                      pageViewItem(
                        highestViolations: controller.highestViolationsInWeek,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: true,
                        barChart: barChartDistribution(
                          tooltipBehavior: controller.tooltipBehavior,
                          dataSource: [
                            ...List.generate(
                              controller.weeklyViolations.length,
                              (index) => controller.weeklyViolations[index],
                            ),
                          ],
                        ),
                      ),
                      pageViewItem(
                        highestViolations: controller.highestViolationsInMonth,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: false,
                        barChart: barChartDistribution(
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
