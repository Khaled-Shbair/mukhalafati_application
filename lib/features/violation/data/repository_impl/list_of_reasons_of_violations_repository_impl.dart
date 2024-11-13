import '/config/all_imports.dart';

class ListOfReasonsOfViolationsRepositoryImpl
    extends ListOfReasonsOfViolationsRepository {
  final RemoteListOfReasonsOfViolationsDataSource _dataSource;
  final NetworkInfo _networkInfo;

  ListOfReasonsOfViolationsRepositoryImpl(this._dataSource, this._networkInfo);

  @override
  Future<Either<Failure, ListOfReasonsOfViolationsModel>>
      listOfReasonsOfViolations() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _dataSource.listOfReasonsOfViolations();
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
