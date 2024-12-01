import '/config/all_imports.dart';

class SendVerificationCodeRepositoryImpl
    extends SendVerificationCodeRepository {
  final RemoteSendVerificationCodeDataSource _dataSource;
  final NetworkInfo _networkInfo;

  SendVerificationCodeRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, SendVerificationCodeModel>> sendVerificationCode(
      request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.sendVerificationCode(request);
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
