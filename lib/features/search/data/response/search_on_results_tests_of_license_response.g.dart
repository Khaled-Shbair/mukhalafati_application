// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_on_results_tests_of_license_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOnResultsTestsOfLicenseResponse
    _$SearchOnResultsTestsOfLicenseResponseFromJson(
            Map<String, dynamic> json) =>
        SearchOnResultsTestsOfLicenseResponse(
          licenseTestResults: json['license_test_result'] as bool?,
          practicalTestResult: json['practical_test_result'] as bool?,
          studentName: json['student_name'] as String?,
        );

Map<String, dynamic> _$SearchOnResultsTestsOfLicenseResponseToJson(
        SearchOnResultsTestsOfLicenseResponse instance) =>
    <String, dynamic>{
      'student_name': instance.studentName,
      'license_test_result': instance.licenseTestResults,
      'practical_test_result': instance.practicalTestResult,
    };
