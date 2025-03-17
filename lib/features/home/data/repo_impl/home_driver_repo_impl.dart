import '/config/all_imports.dart';

class HomeDriverRepoImpl extends HomeDriverRepo {
  final RemoteHomeDriverDataSource _dataSource;
  final LocalHomeDriverDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  HomeDriverRepoImpl(
    this._dataSource,
    this._networkInfo,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, HomeDriverModel>> getHomeDriverData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getHomeDriverData();
        print('ssss: ${response.numberOfUnReadNotifications}');
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
      final response = await _localDataSource.getHomeDriverData();
      return Right(response);
      // return Left(
      //   Failure(
      //     message: ManagerStrings.noInternetConnection,
      //     code: ResponseCode.NO_INTERNET_CONNECTION.value,
      //   ),
      // );
    }
  }
}
