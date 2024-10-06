import '/config/all_imports.dart';

Widget pageViewItem({
  required String totalViolations,
  required String highestViolations,
  required Widget barChart,
  bool isTotalOfWeek = true,
  double? startBarchartPadding,
}) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(width: ManagerWidth.w6),
          statisticsBoxPoliceMan(
            title: ManagerStrings.totalViolations,
            subTitle: totalViolations,
          ),
          SizedBox(width: ManagerWidth.w16),
          statisticsBoxPoliceMan(
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
          color: ManagerColors.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ManagerRadius.r5),
            topRight: Radius.circular(ManagerRadius.r5),
          ),
        ),
        child: Text(
          isTotalOfWeek
              ? ManagerStrings.distributionOfViolationsByDays
              : ManagerStrings.distributionOfViolationsByMonths,
          style: TextStyle(
            color: ManagerColors.white,
            fontWeight: ManagerFontWeight.bold,
            fontSize: ManagerFontsSizes.f14,
          ),
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
        child: barChart,
      ),
    ],
  );
}
