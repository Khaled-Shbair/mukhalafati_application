import '/config/all_imports.dart';

class CustomPageViewItem extends StatelessWidget {
  const CustomPageViewItem({
    required this.totalViolations,
    required this.highestViolations,
    required this.barChart,
    this.startBarchartPadding,
    this.isTotalOfWeek = true,
    this.visible = false,
    super.key,
  });

  final String totalViolations;
  final String highestViolations;
  final Widget barChart;
  final bool isTotalOfWeek;
  final double? startBarchartPadding;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            horizontalSpace(ManagerWidth.w6),
            CustomStatisticsBoxPoliceMan(
              title: ManagerStrings.totalViolations,
              subTitle: totalViolations,
            ),
            horizontalSpace(ManagerWidth.w16),
            CustomStatisticsBoxPoliceMan(
              title: isTotalOfWeek
                  ? ManagerStrings.highestDayForViolations
                  : ManagerStrings.highestMonthlyForViolations,
              subTitle: highestViolations,
            ),
          ],
        ),
        Container(
          alignment: AlignmentDirectional.center,
          height: ManagerHeight.h40,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ManagerRadius.r5),
              topRight: Radius.circular(ManagerRadius.r5),
            ),
          ),
          child: Text(
            isTotalOfWeek
                ? ManagerStrings.distributionOfViolationsByDays
                : ManagerStrings.distributionOfViolationsByMonths,
            style: context.textTheme
                .logoutAndCreateComplaintAndNameDriverButton(context),
          ),
        ),
        Container(
          padding: EdgeInsetsDirectional.only(
            start: startBarchartPadding ?? ManagerWidth.w20,
            end: ManagerWidth.w20,
            bottom: ManagerHeight.h10,
            top: ManagerHeight.h16,
          ),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(ManagerRadius.r5),
            boxShadow: [
              BoxShadow(
                color: context.theme.colorScheme.shadow,
                offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
                blurRadius: AppConstants
                    .blurRadiusOfBoxShadowInTabBarViewInPoliceManHomeScreen,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                visible: visible,
                child: SizedBox(
                  width: ManagerWidth.w246,
                  child: Text(
                    ManagerStrings.noteInPoliceHomeScreen,
                    textAlign: TextAlign.start,
                    style: context.textTheme
                        .textStyleOfNoteInPoliceHomeScreen(context),
                  ),
                ),
              ),
              verticalSpace(ManagerHeight.h10),
              barChart,
            ],
          ),
        ),
      ],
    );
  }
}
