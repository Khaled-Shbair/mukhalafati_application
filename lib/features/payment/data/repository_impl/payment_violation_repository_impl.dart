import '/config/all_imports.dart';

class PaymentViolationRepositoryImpl extends PaymentViolationRepository {
  final RemotePaymentViolationDataSource _dataSource;
  final NetworkInfo _networkInfo;

  PaymentViolationRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, PaymentViolationModel>> paymentViolation(
      PaymentViolationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.paymentViolation(request);
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
