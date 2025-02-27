class HomePoliceManModel {
  final String maxDayName;
  final String maxMonthName;
  final int totalViolationsWeek;
  final int totalViolationsYear;
  final List<TotalViolationsModel> weeklyViolations;
  final List<TotalViolationsModel> monthlyViolations;

  HomePoliceManModel({
    required this.maxDayName,
    required this.maxMonthName,
    required this.weeklyViolations,
    required this.totalViolationsWeek,
    required this.monthlyViolations,
    required this.totalViolationsYear,
  });
}

class TotalViolationsModel {
  final int count;
  final String name;

  TotalViolationsModel({
    required this.name,
    required this.count,
  });
}
