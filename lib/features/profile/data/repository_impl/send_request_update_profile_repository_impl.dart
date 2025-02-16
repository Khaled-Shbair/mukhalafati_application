import '/config/all_imports.dart';

class SendRequestUpdateProfileRepositoryImpl
    extends SendRequestUpdateProfileRepository {
  final RemoteSendRequestUpdateProfileDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SendRequestUpdateProfileRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, SendRequestUpdateProfileModel>>
      sendRequestUpdateProfile(request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.sendRequestUpdateProfile(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
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
