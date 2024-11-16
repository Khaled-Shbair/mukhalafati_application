import '/config/all_imports.dart';

class DriverViolationsRepositoryImpl extends DriverViolationsRepository {
  final RemoteDriverViolationsDataSource _dataSource;
  final NetworkInfo _networkInfo;

  DriverViolationsRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, DriverViolationsModel>> getDriverViolations(
      DriverViolationsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getDriverViolations(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(
        Failure(
          code: ResponseCode.NO_INTERNET_CONNECTION.value,
          message: ManagerStrings.noInternetConnection,
        ),
      );
    }
  }
}
