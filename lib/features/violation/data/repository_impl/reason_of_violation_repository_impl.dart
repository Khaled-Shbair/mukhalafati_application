

import '/config/all_imports.dart';

class ReasonOfViolationRepositoryImpl
    extends ReasonOfViolationRepository {
  final RemoteReasonOfViolationDataSource  _dataSource;
  final NetworkInfo _networkInfo;

  ReasonOfViolationRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, ReasonOfViolationModel>>
      reasonOfViolation(ReasonOfViolationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.reasonOfViolation(request);
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
