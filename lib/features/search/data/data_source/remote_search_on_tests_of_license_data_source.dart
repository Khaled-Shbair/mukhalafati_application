import '/config/all_imports.dart';

abstract class RemoteSearchOnResultsTestsOfLicenseDataSource {
  Future<SearchOnResultsTestsOfLicenseResponse> searchOnResultsTestsOfLicense(
      SearchOnResultsTestsOfLicenseRequest request);
}

class RemoteSearchOnResultsTestsOfLicenseDataSourceImpl
    extends RemoteSearchOnResultsTestsOfLicenseDataSource {
  final AppApi _appApi;

  RemoteSearchOnResultsTestsOfLicenseDataSourceImpl(this._appApi);

  @override
  Future<SearchOnResultsTestsOfLicenseResponse> searchOnResultsTestsOfLicense(
      SearchOnResultsTestsOfLicenseRequest request) async {
    return await _appApi.searchOnResultsTestsOfLicense(
      request.idNumber,
    );
  }
}
