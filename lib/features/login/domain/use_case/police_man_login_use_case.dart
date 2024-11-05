import '/config/all_imports.dart';

class PoliceManLoginInput {
  String? jobNumber;
  String? password;

  PoliceManLoginInput({
    required this.jobNumber,
    required this.password,
  });
}

class PoliceManLoginUseCase
    extends BaseUseCase<PoliceManLoginInput, PoliceManLoginModel> {
  final PoliceManLoginRepository _repository;

  PoliceManLoginUseCase(this._repository);

  @override
  Future<Either<Failure, PoliceManLoginModel>> execute(
      PoliceManLoginInput input) async {
    return await _repository.login(
      PoliceManLoginRequest(
        jobNumber: input.jobNumber,
        password: input.password,
      ),
    );
  }
}
