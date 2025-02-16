import '/config/all_imports.dart';

class SearchOnResultsTestsOfLicenseUseCaseInput {
  String? idNumber;

  SearchOnResultsTestsOfLicenseUseCaseInput({
    required this.idNumber,
  });
}

class SearchOnResultsTestsOfLicenseUseCase
    extends BaseUseCase<SearchOnResultsTestsOfLicenseUseCaseInput, SearchOnResultsTestsOfLicenseModel> {
  final SearchOnResultsTestsOfLicenseRepository _repository;

  SearchOnResultsTestsOfLicenseUseCase(this._repository);

  @override
  Future<Either<Failure, SearchOnResultsTestsOfLicenseModel>> execute(
      SearchOnResultsTestsOfLicenseUseCaseInput input) async {
    return await _repository.searchOnResultsTestsOfLicense(
      SearchOnResultsTestsOfLicenseRequest(
        idNumber: input.idNumber,
      ),
    );
  }
}
