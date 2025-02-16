import '/config/all_imports.dart';

class PoliceManChangePasswordRepositoryImpl
    extends PoliceManChangePasswordRepository {
  final RemotePoliceManChangePasswordDataSource _dataSource;
  final NetworkInfo _networkInfo;

  PoliceManChangePasswordRepositoryImpl(
    this._dataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, PoliceManChangePasswordModel>> changePassword(
      PoliceManChangePasswordRequest request) async {
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
