import '/config/all_imports.dart';

class GetAllComplaintsRepositoryImpl extends GetAllComplaintsRepository {
  final RemoteGetAllComplaintsDataSource _dataSource;
  final NetworkInfo _networkInfo;

  GetAllComplaintsRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, GetAllComplaintsModel>> getAllComplaints(
      GetAllComplaintsRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllComplaints(request);
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
