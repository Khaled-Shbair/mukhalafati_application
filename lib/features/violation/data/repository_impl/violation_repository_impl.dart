import '/config/all_imports.dart';

class ViolationRepositoryImpl extends ViolationRepository {
  final RemoteViolationDataSource _dataSource;
  final NetworkInfo _networkInfo;

  ViolationRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, CreateViolationModel>> createViolation(
      CreateViolationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.createViolation(request);
        if (response.status == true) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              code: ResponseCode.NOT_FOUND.value,
              message: response.message.onNull(),
            ),
          );
        }
      } catch (e) {
        return Left(ErrorHandler
            .handle(e)
            .failure);
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

  @override
  Future<Either<Failure, AllReasonsOfViolationModel>>
  getAllReasonsForViolation() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllReasonsForViolation();
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler
            .handle(e)
            .failure);
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

  @override
  Future<Either<Failure, AllViolationModel>> getAllViolation(
      AllViolationRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getAllViolation(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler
            .handle(e)
            .failure);
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

  @override
  Future<Either<Failure, GetViolationDetailsModel>> getViolationDetailsById(
      request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.getViolationDetailsById(request);
        return Right(response.toDomain());
      } catch (e) {
        return Left(ErrorHandler
            .handle(e)
            .failure);
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
