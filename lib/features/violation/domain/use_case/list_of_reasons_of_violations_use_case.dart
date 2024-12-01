import '/config/all_imports.dart';

class ListOfReasonsOfViolationsUseCase
    extends BaseOutUseCase<ListOfReasonsOfViolationsModel> {
  final ListReasonsOfViolationsRepository _repository;

  ListOfReasonsOfViolationsUseCase(this._repository);

  @override
  Future<Either<Failure, ListOfReasonsOfViolationsModel>> execute() async {
    return await _repository.listOfReasonsOfViolations();
  }
}
