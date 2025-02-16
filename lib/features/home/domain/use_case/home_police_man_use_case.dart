import '/config/all_imports.dart';

class HomePoliceManUseCase extends BaseOutUseCase<HomePoliceManModel> {
  final HomePoliceManRepo _repo;

  HomePoliceManUseCase(this._repo);

  @override
  Future<Either<Failure, HomePoliceManModel>> execute() async {
    return await _repo.homePoliceMan();
  }
}
