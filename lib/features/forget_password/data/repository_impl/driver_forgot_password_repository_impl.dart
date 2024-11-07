import '/config/all_imports.dart';

class DriverForgotPasswordRepositoryImpl
    extends DriverForgotPasswordRepository {
  final RemoteDriverForgotPasswordDataSource _dataSource;
  final NetworkInfo _networkInfo;

  DriverForgotPasswordRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, DriverForgotPasswordModel>> forgotPassword(
      DriverForgotPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.forgotPassword(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(Failure(
        code: ResponseCode.NO_INTERNET_CONNECTION.value,
        message: ManagerStrings.noInternetConnection,
      ));
    }
  }
}
