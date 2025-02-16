import '/config/all_imports.dart';

part 'home_police_man_response.g.dart';

@JsonSerializable()
class HomePoliceManResponse {
  @JsonKey(name: ApiKeys.maxDayName)
  String? maxDayName;
  @JsonKey(name: ApiKeys.maxMonthName)
  String? maxMonthName;
  @JsonKey(name: ApiKeys.totalViolationsWeek)
  int? totalViolationsWeek;
  @JsonKey(name: ApiKeys.totalViolationsYear)
  int? totalViolationsYear;
  @JsonKey(name: ApiKeys.weeklyViolations)
  List<WeeklyViolationsResponse>? weeklyViolations;
  @JsonKey(name: ApiKeys.monthlyViolations)
  List<MonthlyViolationsResponse>? monthlyViolations;


  HomePoliceManResponse({
    required this.maxDayName,
    required this.maxMonthName,
    required this.weeklyViolations,
    required this.totalViolationsWeek,
    required this.monthlyViolations,
    required this.totalViolationsYear,
  });

  factory HomePoliceManResponse.fromJson(Map<String, dynamic> json) =>
      _$HomePoliceManResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HomePoliceManResponseToJson(this);
}

@JsonSerializable()
class WeeklyViolationsResponse {
  @JsonKey(name: ApiKeys.violationsCount)
  int? violationsCount;
  @JsonKey(name: ApiKeys.dayOfWeek)
  String? dayOfWeek;

  WeeklyViolationsResponse({
    required this.dayOfWeek,
    required this.violationsCount,
  });

  factory WeeklyViolationsResponse.fromJson(Map<String, dynamic> json) =>
      _$WeeklyViolationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WeeklyViolationsResponseToJson(this);
}

@JsonSerializable()
class MonthlyViolationsResponse {
  @JsonKey(name: ApiKeys.violationsCount)
  int? violationsCount;
  @JsonKey(name: ApiKeys.month)
  String? month;

  MonthlyViolationsResponse({
    required this.month,
    required this.violationsCount,
  });

  factory MonthlyViolationsResponse.fromJson(Map<String, dynamic> json) =>
      _$MonthlyViolationsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$MonthlyViolationsResponseToJson(this);
}
