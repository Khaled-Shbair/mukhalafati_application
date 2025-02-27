import '/config/all_imports.dart';

part 'search_on_results_tests_of_license_response.g.dart';

@JsonSerializable()
class SearchOnResultsTestsOfLicenseResponse {
  @JsonKey(name: ApiKeys.studentName)
  String? studentName;

  @JsonKey(name: ApiKeys.licenseTestResult)
  bool? licenseTestResults;
  @JsonKey(name: ApiKeys.practicalTestResult)
  bool? practicalTestResult;

  SearchOnResultsTestsOfLicenseResponse({
    required this.licenseTestResults,
    required this.practicalTestResult,
    required this.studentName,
  });

  factory SearchOnResultsTestsOfLicenseResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SearchOnResultsTestsOfLicenseResponseFromJson(json);

  Map<String, dynamic> toJson(SearchOnResultsTestsOfLicenseResponse instance) =>
      _$SearchOnResultsTestsOfLicenseResponseToJson(this);
}
