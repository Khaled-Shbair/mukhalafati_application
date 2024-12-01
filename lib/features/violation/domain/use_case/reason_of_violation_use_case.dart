import '/config/all_imports.dart';

class ReasonOfViolationUseCaseInput {
  int? id;

  ReasonOfViolationUseCaseInput({
    required this.id,
  });
}

class ReasonOfViolationUseCase
    extends BaseUseCase<ReasonOfViolationUseCaseInput, ReasonOfViolationModel> {
  final ReasonOfViolationRepository _repository;

  ReasonOfViolationUseCase(this._repository);

  @override
  Future<Either<Failure, ReasonOfViolationModel>> execute(input) async {
    return await _repository.reasonOfViolation(
      ReasonOfViolationRequest(
        id: input.id,
      ),
    );
  }
}
