import '/config/all_imports.dart';

class GetHomeDriverDataUseCase extends BaseOutUseCase<HomeDriverModel> {
  final HomeDriverRepo _repo;

  GetHomeDriverDataUseCase(this._repo);

  @override
  Future<Either<Failure, HomeDriverModel>> execute() async {
    return await _repo.getHomeDriverData();
  }
}
