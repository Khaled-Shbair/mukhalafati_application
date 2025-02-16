import '/config/all_imports.dart';

extension HomePoliceManMapper on HomePoliceManResponse {
  toDomain() {
    return HomePoliceManModel(
      maxDayName: maxDayName.onNull(),
      maxMonthName: maxMonthName.onNull(),
      totalViolationsWeek: totalViolationsWeek.onNull(),
      totalViolationsYear: totalViolationsYear.onNull(),
      monthlyViolations: monthlyViolations
              ?.map<TotalViolationsModel>((e) => e.toDomain())
              .toList() ??
          [],
      weeklyViolations: weeklyViolations
              ?.map<TotalViolationsModel>((e) => e.toDomain())
              .toList() ??
          [],
    );
  }
}

extension WeeklyViolationsMapper on WeeklyViolationsResponse {
  toDomain() {
    return TotalViolationsModel(
      count: violationsCount.onNull(),
      name: dayOfWeek.onNull(),
    );
  }
}

extension MonthlyViolationsMapper on MonthlyViolationsResponse {
  toDomain() {
    return TotalViolationsModel(
      count: violationsCount.onNull(),
      name: month.onNull(),
    );
  }
}
