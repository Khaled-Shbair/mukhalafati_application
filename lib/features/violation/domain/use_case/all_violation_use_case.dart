import '/config/all_imports.dart';

class AllViolationUseCaseInput {
  final int page;
  final int limit;

  AllViolationUseCaseInput({
    required this.page,
    required this.limit,
  });
}

class AllViolationUseCase
    extends BaseUseCase<AllViolationUseCaseInput, AllViolationModel> {
  final ViolationRepository _repository;

  AllViolationUseCase(this._repository);

  @override
  Future<Either<Failure, AllViolationModel>> execute(input) async {
    return await _repository.getAllViolation(
      AllViolationRequest(
        page: input.page,
        limit: input.limit,
      ),
    );
  }
}
