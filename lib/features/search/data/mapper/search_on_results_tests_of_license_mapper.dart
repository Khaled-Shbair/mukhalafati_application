import '/config/all_imports.dart';

extension SearchOnResultsTestsOfLicenseMapper
    on SearchOnResultsTestsOfLicenseResponse {
  toDomain() {
    return SearchOnResultsTestsOfLicenseModel(
      licenseTestResults: licenseTestResults.onNull(),
      practicalTestResult: practicalTestResult.onNull(),
      studentName: studentName.onNull(),
    );
  }
}
