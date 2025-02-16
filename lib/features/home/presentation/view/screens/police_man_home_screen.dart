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
            widget: ClipRRect(
              borderRadius: BorderRadius.circular(ManagerRadius.r5),
              child: CustomCachedNetworkImage(
                imageUrl: controller.policeImage,
                fit: BoxFit.fill,
                height: ManagerHeight.h50,
                width: ManagerWidth.w50,
              ),
            ),
          ),
          endDrawer: CustomPoliceManDrawer(isPoliceManHomeScreen: true),
          body: controller.loading == true || controller.homeData == null
              ? CustomLoading()
              : Padding(
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
                              isSelected:
                                  controller.isSelectedButtonWeeklyViolations,
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
                          onPageChanged: (value) =>
                              controller.onPageChanged(value),
                          children: [
                            CustomPageViewItem(
                              highestViolations:
                                  controller.homeData!.maxDayName,
                              totalViolations: controller
                                  .homeData!.totalViolationsWeek
                                  .toString(),
                              isTotalOfWeek: true,
                              barChart: CustomBarChartDistribution(
                                myDate: controller.currentDay,
                                tooltipBehavior: controller.tooltipBehavior,
                                dataSource: [
                                  ...List.generate(
                                    controller
                                        .homeData!.weeklyViolations.length,
                                    (index) => controller
                                        .homeData!.weeklyViolations[index],
                                  ),
                                ],
                              ),
                            ),
                            CustomPageViewItem(
                              highestViolations:
                                  controller.homeData!.maxMonthName,
                              totalViolations: controller
                                  .homeData!.totalViolationsYear
                                  .toString(),
                              isTotalOfWeek: false,
                              visible: true,
                              barChart: CustomBarChartDistribution(
                                myDate: controller.currentMonth,
                                tooltipBehavior: controller.tooltipBehavior,
                                dataSource: [
                                  ...List.generate(
                                    controller
                                        .homeData!.monthlyViolations.length,
                                    (index) => controller
                                        .homeData!.monthlyViolations[index],
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
