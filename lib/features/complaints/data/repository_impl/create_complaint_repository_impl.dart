import '/config/all_imports.dart';

class CreateComplaintRepositoryImpl extends CreateComplaintRepository {
  final RemoteCreateComplaintDataSource _dataSource;
  final NetworkInfo _networkInfo;

  CreateComplaintRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CreateComplaintModel>> createComplaint(
      CreateComplaintRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.createComplaint(request);
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
