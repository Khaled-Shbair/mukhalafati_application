import '/config/all_imports.dart';

class HomeDriverRepoImpl extends HomeDriverRepo {
  final RemoteHomeDriverDataSource _dataSource;
  final NetworkInfo _networkInfo;

  HomeDriverRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, UpdateFcmTokenModel>> updateDriverFcmToken(
      UpdateFcmTokenRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.updateDriverFcmToken(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(
          Failure(
            message: ManagerStrings.badRequest,
            code: ResponseCode.BAD_REQUEST.value,
          ),
        );
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
