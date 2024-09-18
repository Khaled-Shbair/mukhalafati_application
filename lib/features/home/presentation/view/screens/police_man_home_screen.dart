import '/config/all_imports.dart';

class PoliceManHomeScreen extends StatelessWidget {
  const PoliceManHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoliceManHomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ManagerColors.white,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
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
                      subTitle: '666',
                    ),
                    SizedBox(width: ManagerWidth.w14),
                    statisticsBoxPoliceMan(
                      title: ManagerStrings.highestDayForViolations,
                      subTitle: '${ManagerStrings.saturday}',
                    ),
                  ],
                ),
                TabBar(
                  controller: controller.tabController,
                  tabs: [
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
