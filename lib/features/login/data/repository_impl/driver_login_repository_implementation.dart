import '/config/all_imports.dart';

class DriverLoginRepositoryImplementation extends DriverLoginRepository {
  final RemoteDriverLoginDataSource _remoteLoginDataSource;
  final NetworkInfo _networkInfo;

  DriverLoginRepositoryImplementation(
      this._remoteLoginDataSource, this._networkInfo);

  @override
  Future<Either<Failure, DriverLoginModel>> login(
      DriverLoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        DriverLoginResponse response =
            await _remoteLoginDataSource.login(request);
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
