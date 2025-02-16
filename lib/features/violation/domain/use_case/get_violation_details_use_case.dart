import '/config/all_imports.dart';

class GetViolationDetailsUseCaseInput {
  final int violationId;

  GetViolationDetailsUseCaseInput({
    required this.violationId,
  });
}

class GetViolationDetailsUseCase extends BaseUseCase<
    GetViolationDetailsUseCaseInput, GetViolationDetailsModel> {
  final ViolationRepository _repository;

  GetViolationDetailsUseCase(this._repository);

  @override
  Future<Either<Failure, GetViolationDetailsModel>> execute(input) async {
    return await _repository.getViolationDetailsById(
      GetViolationDetailsRequest(violationId: input.violationId),
    );
  }
}
