import '/config/all_imports.dart';

class CustomBarChartDistribution extends StatelessWidget {
  const CustomBarChartDistribution({
    required this.dataSource,
    required this.tooltipBehavior,
    super.key,
  });

  final List<BarChartData> dataSource;
  final TooltipBehavior tooltipBehavior;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryYAxis: const NumericAxis(
        isVisible: false,
      ),
      primaryXAxis: const CategoryAxis(
        arrangeByIndex: true,
      ),
      legend: Legend(isVisible: true),
      /////
      tooltipBehavior: tooltipBehavior,
      series: <CartesianSeries>[
        ColumnSeries<BarChartData, String>(
          isVisibleInLegend: false,
          enableTooltip: true,
          dataSource: dataSource,
          xValueMapper: (BarChartData data, _) => data.x,
          yValueMapper: (BarChartData data, _) => data.y,
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
            textStyle: context.textTheme
                .titleCustomStatisticsBoxPoliceManAndDataLabelInBarChart(
                    context),
          ),
          color: context.theme.primaryColor,
        ),
      ],
    );
  }
}
