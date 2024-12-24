import '/config/all_imports.dart';

class CustomStatisticsBoxPoliceMan extends StatelessWidget {
  const CustomStatisticsBoxPoliceMan({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: ManagerHeight.h90,
        padding: EdgeInsetsDirectional.only(
          start: ManagerWidth.w6,
          end: ManagerWidth.w6,
          top: ManagerHeight.h12,
          bottom: ManagerHeight.h10,
        ),
        margin: EdgeInsetsDirectional.only(
          bottom: ManagerHeight.h22,
        ),
        decoration: BoxDecoration(
          color: context.theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(ManagerRadius.r5),
          boxShadow: [
            BoxShadow(
              color: context.theme.primaryColor,
              offset: Offset(ManagerWidth.w5, ManagerHeight.h0),
            ),
            BoxShadow(
              color: context.theme.colorScheme.shadow,
              offset: Offset(ManagerWidth.w0, ManagerHeight.h4),
              blurRadius: AppConstants
                  .blurRadiusOfBoxShadowInCustomStatisticsBoxPoliceManWidget,
              spreadRadius: AppConstants
                  .spreadRadiusOfBoxShadowInCustomStatisticsBoxPoliceManWidget,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: context.textTheme.titleCustomStatisticsBoxPoliceManAndDataLabelInBarChart(context),
            ),
            verticalSpace(ManagerHeight.h5),
            Text(
              subTitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: context.textTheme.subTitleCustomStatisticsBoxPoliceMan(context),
            ),
          ],
        ),
      ),
    );
  }
}
