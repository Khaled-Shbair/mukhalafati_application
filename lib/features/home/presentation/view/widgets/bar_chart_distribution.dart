import '/config/all_imports.dart';

Widget barChartDistribution({
  required List<BarChartData> dataSource,
  required TooltipBehavior tooltipBehavior,
}) {
  return SfCartesianChart(
    primaryYAxis: const NumericAxis(
      isVisible: false,
    ),
    primaryXAxis: const CategoryAxis(
      arrangeByIndex: true,
    ),
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
          textStyle: TextStyle(
            color: ManagerColors.black,
            fontFamily: ManagerFontFamily.cairo,
            fontSize: ManagerFontsSizes.f11,
            fontWeight: ManagerFontWeight.semiBold,
          ),
        ),
        color: ManagerColors.primaryColor,
      ),
    ],
  );
}
