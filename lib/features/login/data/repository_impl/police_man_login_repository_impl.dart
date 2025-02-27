import '/config/all_imports.dart';

class PoliceManLoginRepositoryImpl extends PoliceManLoginRepository {
  final RemotePoliceManLoginDataSource _dataSource;
  final NetworkInfo _networkInfo;

  PoliceManLoginRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, PoliceManLoginModel>> login(
      PoliceManLoginRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.login(request);
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
