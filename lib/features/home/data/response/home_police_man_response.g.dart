// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_police_man_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePoliceManResponse _$HomePoliceManResponseFromJson(
        Map<String, dynamic> json) =>
    HomePoliceManResponse(
      maxDayName: json['max_day_name'] as String?,
      maxMonthName: json['max_month_name'] as String?,
      weeklyViolations: (json['weekly_violations'] as List<dynamic>?)
          ?.map((e) =>
              WeeklyViolationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalViolationsWeek: (json['total_violations_week'] as num?)?.toInt(),
      monthlyViolations: (json['monthly_violations'] as List<dynamic>?)
          ?.map((e) =>
              MonthlyViolationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalViolationsYear: (json['total_violations_year'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HomePoliceManResponseToJson(
        HomePoliceManResponse instance) =>
    <String, dynamic>{
      'max_day_name': instance.maxDayName,
      'max_month_name': instance.maxMonthName,
      'total_violations_week': instance.totalViolationsWeek,
      'total_violations_year': instance.totalViolationsYear,
      'weekly_violations': instance.weeklyViolations,
      'monthly_violations': instance.monthlyViolations,
    };

WeeklyViolationsResponse _$WeeklyViolationsResponseFromJson(
        Map<String, dynamic> json) =>
    WeeklyViolationsResponse(
      dayOfWeek: json['day_of_week'] as String?,
      violationsCount: (json['violations_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WeeklyViolationsResponseToJson(
        WeeklyViolationsResponse instance) =>
    <String, dynamic>{
      'violations_count': instance.violationsCount,
      'day_of_week': instance.dayOfWeek,
    };

MonthlyViolationsResponse _$MonthlyViolationsResponseFromJson(
        Map<String, dynamic> json) =>
    MonthlyViolationsResponse(
      month: json['month'] as String?,
      violationsCount: (json['violations_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MonthlyViolationsResponseToJson(
        MonthlyViolationsResponse instance) =>
    <String, dynamic>{
      'violations_count': instance.violationsCount,
      'month': instance.month,
    };
