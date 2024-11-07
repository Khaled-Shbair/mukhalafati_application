import '/config/all_imports.dart';

class DriverChangePasswordRepositoryImpl
    extends DriverChangePasswordRepository {
  final RemoteDriverChangePasswordDataSource _dataSource;
  final NetworkInfo _networkInfo;

  DriverChangePasswordRepositoryImpl(
    this._dataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, DriverChangePasswordModel>> changePassword(
      DriverChangePasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.changePassword(request);
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
