import '/config/all_imports.dart';

class PoliceManHomeScreen extends StatelessWidget {
  const PoliceManHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoliceManHomeController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: ManagerColors.white,
            actions: [
              mainButton(
                onPressed: () => controller.openEndDrawer(),
                minWidth: ManagerWidth.w30,
                height: ManagerHeight.h30,
                color: ManagerColors.transparent,
                highlightColor: ManagerColors.transparent,
                splashColor: ManagerColors.transparent,
                side: BorderSide.none,
                child: const Icon(
                  Icons.menu,
                  color: ManagerColors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          endDrawer: policeManDrawer(
            isPoliceManHomeScreen: true,
            policeName: controller.policeName,
            policeImage: controller.policeImage,
          ),
          body: Padding(
            padding: EdgeInsetsDirectional.only(
              start: ManagerWidth.w16,
              end: ManagerWidth.w23,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    statisticsBoxPoliceMan(
                      title: ManagerStrings.totalViolations,
                      subTitle: controller.totalViolations,
                    ),
                    SizedBox(width: ManagerWidth.w14),
                    statisticsBoxPoliceMan(
                      title: ManagerStrings.highestDayForViolations,
                      subTitle: ManagerStrings.saturday,
                    ),
                  ],
                ),
                SizedBox(height: ManagerHeight.h26),
                TabBar(
                  controller: controller.tabController,
                  dividerColor: ManagerColors.transparent,
                  labelStyle: TextStyle(
                    color: ManagerColors.white,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f9,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: ManagerColors.black,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontSize: ManagerFontsSizes.f9,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabAlignment: TabAlignment.center,
                  indicator: BoxDecoration(
                    color: ManagerColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(ManagerRadius.r5),
                      topLeft: Radius.circular(ManagerRadius.r5),
                    ),
                  ),
                  isScrollable: false,
                  tabs: [
                    Text(ManagerStrings.dailyViolations),
                    Text(ManagerStrings.weeklyViolations),
                    Text(ManagerStrings.monthlyViolations),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsetsDirectional.only(
                      bottom: ManagerHeight.h40,
                    ),
                    decoration: BoxDecoration(
                      color: ManagerColors.white,
                      borderRadius: BorderRadius.circular(ManagerRadius.r5),
                      boxShadow: [
                        BoxShadow(
                          color: ManagerColors.black5,
                          offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                          blurRadius: AppConstants
                              .blurRadiusOfBoxShadowInTabBarViewInPoliceManHomeScreen,
                        ),
                      ],
                    ),
                    child: TabBarView(
                      controller: controller.tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: ManagerHeight.h28),
                            Text(
                              ManagerStrings.numberOfDailyViolations,
                              style: TextStyle(
                                color: ManagerColors.primaryColor,
                                fontFamily: ManagerFontFamily.cairo,
                                fontWeight: ManagerFontWeight.bold,
                                fontSize: ManagerFontsSizes.f12,
                              ),
                            ),
                            SizedBox(height: ManagerHeight.h12),
                            //Chart
                          ],
                        ),
                        Text('2'),
                        Text('3'),
                      ],
                    ),
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
