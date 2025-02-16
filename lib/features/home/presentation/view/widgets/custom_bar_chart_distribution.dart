import '/config/all_imports.dart';

class CustomBarChartDistribution extends StatelessWidget {
  const CustomBarChartDistribution({
    required this.dataSource,
    required this.tooltipBehavior,
    required this.myDate,
    super.key,
  });

  final List<TotalViolationsModel> dataSource;
  final TooltipBehavior tooltipBehavior;
  final String myDate;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: NumericAxis(
        isVisible: false,
        labelStyle: context.textTheme
            .textStyleOfLabelOfYAxisInCustomBarChartDistribution(context),
      ),
      primaryXAxis: CategoryAxis(
        labelPlacement: LabelPlacement.betweenTicks,
        interval: 1,
        maximumLabels: 12,
        isInversed: true,
        arrangeByIndex: true,
        labelIntersectAction: AxisLabelIntersectAction.wrap,
        labelStyle: context.textTheme
            .textStyleOfLabelOfXAxisInCustomBarChartDistribution(context),
      ),
      legend: Legend(isVisible: true),
      tooltipBehavior: tooltipBehavior,
      series: <CartesianSeries>[
        ColumnSeries<TotalViolationsModel, String>(
          isVisibleInLegend: false,
          enableTooltip: true,
          dataSource: dataSource,
          xValueMapper: (TotalViolationsModel data, _) => data.name,
          yValueMapper: (TotalViolationsModel data, _) => data.count,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            margin: EdgeInsets.only(
              top: ManagerHeight.h16,
            ),
            textStyle: context.textTheme
                .titleCustomStatisticsBoxPoliceManAndDataLabelInBarChart(
                    context),
          ),
          pointColorMapper: (datum, index) {
            if (datum.name == myDate) {
              return context.theme.primaryColor;
            } else {
              return context.theme.colorScheme.inversePrimary;
            }
          },
          color: context.theme.primaryColor,
        ),
      ],
    );
  }
}
