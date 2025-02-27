import '/config/all_imports.dart';

class GetHomePoliceManDataUseCase extends BaseOutUseCase<HomePoliceManModel> {
  final HomePoliceManRepo _repo;

  GetHomePoliceManDataUseCase(this._repo);

  @override
  Future<Either<Failure, HomePoliceManModel>> execute() async {
    return await _repo.getHomePoliceManData();
  }
}
