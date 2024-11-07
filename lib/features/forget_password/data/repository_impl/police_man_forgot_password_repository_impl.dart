import '/config/all_imports.dart';

class PoliceManForgotPasswordRepositoryImpl
    extends PoliceManForgotPasswordRepository {
  final RemotePoliceManForgotPasswordDataSource _dataSource;
  final NetworkInfo _networkInfo;

  PoliceManForgotPasswordRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, PoliceManForgotPasswordModel>> forgotPassword(
      PoliceManForgotPasswordRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.forgotPassword(request);
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
