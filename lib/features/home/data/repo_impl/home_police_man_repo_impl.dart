import '/config/all_imports.dart';

class HomePoliceManRepoImpl extends HomePoliceManRepo {
  final RemoteHomePoliceManDataSource _dataSource;
  final NetworkInfo _networkInfo;

  HomePoliceManRepoImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomePoliceManModel>> homePoliceMan() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.homePoliceMan();
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
