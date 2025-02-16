import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseRepositoryImpl
    extends SearchOnResultsTestsOfLicenseRepository {
  final RemoteSearchOnResultsTestsOfLicenseDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SearchOnResultsTestsOfLicenseRepositoryImpl(
      this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, SearchOnResultsTestsOfLicenseModel>>
      searchOnResultsTestsOfLicense(
          SearchOnResultsTestsOfLicenseRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _dataSource.searchOnResultsTestsOfLicense(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          message: ManagerStrings.noInternetConnection,
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
        ),
      );
    }
  }
}
