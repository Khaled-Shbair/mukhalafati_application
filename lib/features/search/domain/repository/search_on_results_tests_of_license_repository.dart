import '/config/all_imports.dart';

abstract class SearchOnResultsTestsOfLicenseRepository {
  Future<Either<Failure, SearchOnResultsTestsOfLicenseModel>>
      searchOnResultsTestsOfLicense(
          SearchOnResultsTestsOfLicenseRequest request);
}
