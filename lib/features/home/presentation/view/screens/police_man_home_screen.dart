import 'package:mukhalafati_application/features/home/presentation/view/widgets/tab_bar_view_item.dart';

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
                  image: NetworkImage(controller.policeImage),
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
                TabBar(
                  controller: controller.tabController,
                  dividerColor: ManagerColors.transparent,
                  labelStyle: TextStyle(
                    color: ManagerColors.white,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.bold,
                    fontSize: ManagerFontsSizes.f13,
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: ManagerColors.primaryColor,
                    fontFamily: ManagerFontFamily.cairo,
                    fontWeight: ManagerFontWeight.semiBold,
                    fontSize: ManagerFontsSizes.f13,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: ManagerColors.primaryColor,
                    borderRadius: BorderRadius.circular(ManagerRadius.r5),
                  ),
                  padding: EdgeInsetsDirectional.only(
                    bottom: ManagerHeight.h28,
                  ),
                  labelPadding: EdgeInsetsDirectional.only(
                    start: ManagerWidth.w16,
                    end: ManagerWidth.w16,
                  ),
                  isScrollable: false,
                  tabs: [
                    tabBarItemPoliceMan(ManagerStrings.weeklyViolations),
                    tabBarItemPoliceMan(ManagerStrings.monthlyViolations),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller.tabController,
                    children: [
                      tabBarViewItem(
                        highestViolations: controller.highestViolationsInWeek,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: true,
                        barChart: Text(''),
                      ),
                      tabBarViewItem(
                        highestViolations: controller.highestViolationsInMonth,
                        totalViolations: controller.totalViolations,
                        isTotalOfWeek: false,
                        barChart: Text(ManagerStrings.noteOfNumbersMonthsOfYear),

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
