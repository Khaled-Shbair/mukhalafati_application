import '/config/all_imports.dart';

class CreateViolationRepositoryImpl extends CreateViolationRepository {
  final RemoteCreateViolationDataSource _dataSource;
  final NetworkInfo _networkInfo;

  CreateViolationRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CreateViolationModel>> createViolation(
      CreateViolationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.createViolation(request);
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
