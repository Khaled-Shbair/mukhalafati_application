import '/config/all_imports.dart';

class AllReasonOfViolationUseCase
    extends BaseOutUseCase<AllReasonsOfViolationModel> {
  final ViolationRepository _repository;

  AllReasonOfViolationUseCase(this._repository);

  @override
  Future<Either<Failure, AllReasonsOfViolationModel>> execute() async {
    return await _repository.getAllReasonsForViolation();
  }
}
