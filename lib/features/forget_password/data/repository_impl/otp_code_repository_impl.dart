import '/config/all_imports.dart';

class OtpCodeRepositoryImpl extends OtpCodeRepository {
  final RemoteOtpCodeDataSource _dataSource;
  final NetworkInfo _networkInfo;

  OtpCodeRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, OtpCodeModel>> sendOtpCode(request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.sendOtpCode(request);
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

  @override
  Future<Either<Failure, OtpCodeModel>> verifyOtpCode(
      VerifyOtpRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.verifyOtp(request);
        if (response.status == true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              code: ResponseCode.BAD_REQUEST.value,
              message: response.message ?? ManagerStrings.badRequest,
            ),
          );
        }
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
