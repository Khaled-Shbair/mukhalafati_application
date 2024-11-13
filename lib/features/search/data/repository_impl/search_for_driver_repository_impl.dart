import '/config/all_imports.dart';

class SearchForDriverRepositoryImpl extends SearchForDriverRepository {
  final RemoteSearchForDriverDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SearchForDriverRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, SearchForDriverModel>> searchForDriver(
      SearchForDriverRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.searchForDriver(request);
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
