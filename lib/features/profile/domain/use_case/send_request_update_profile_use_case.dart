import '/config/all_imports.dart';

class SendRequestUpdateProfileInput {
  final int driverId;
  final String name;
  final String idNumber;
  final String phoneNumber;
  final String licenseNumber;

  SendRequestUpdateProfileInput({
    required this.phoneNumber,
    required this.idNumber,
    required this.driverId,
    required this.name,
    required this.licenseNumber,
  });
}

class SendRequestUpdateProfileUseCase extends BaseUseCase<
    SendRequestUpdateProfileInput, SendRequestUpdateProfileModel> {
  final SendRequestUpdateProfileRepository _repository;

  SendRequestUpdateProfileUseCase(this._repository);

  @override
  Future<Either<Failure, SendRequestUpdateProfileModel>> execute(input) async {
    return await _repository.sendRequestUpdateProfile(
      SendRequestUpdateProfileRequest(
        phoneNumber: input.phoneNumber,
        idNumber: input.idNumber,
        driverId: input.driverId,
        name: input.name,
        licenseNumber: input.licenseNumber,
      ),
    );
  }
}
