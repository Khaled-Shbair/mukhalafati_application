import '/config/all_imports.dart';

class SearchForDriverInput {
  final String licenseNumber;

  SearchForDriverInput({
    required this.licenseNumber,
  });
}

class SearchForDriverUseCase
    extends BaseUseCase<SearchForDriverInput, SearchForDriverModel> {
  final SearchForDriverRepository _repository;

  SearchForDriverUseCase(this._repository);

  @override
  Future<Either<Failure, SearchForDriverModel>> execute(
      SearchForDriverInput input) async {
    return await _repository.searchForDriver(
      SearchForDriverRequest(
        licenseNumber: input.licenseNumber,
      ),
    );
  }
}
