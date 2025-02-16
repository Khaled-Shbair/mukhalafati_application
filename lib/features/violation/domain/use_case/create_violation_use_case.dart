import '/config/all_imports.dart';

class CreateViolationUseCaseInput {
  String? driverIdNumber;
  String? driverName;
  String? ownerName;
  String? ownerIdNumber;
  String? vehicleNumber;
  String? vehicleType;
  String? vehicleColor;
  String? violationTime;
  String? violationDate;
  String? violationAddress;
  int? reasonOfViolationId;

  CreateViolationUseCaseInput({
    required this.driverIdNumber,
    required this.driverName,
    required this.ownerName,
    required this.ownerIdNumber,
    required this.violationAddress,
    required this.reasonOfViolationId,
    required this.vehicleColor,
    required this.vehicleNumber,
    required this.violationDate,
    required this.vehicleType,
    required this.violationTime,
  });
}

class CreateViolationUseCase
    extends BaseUseCase<CreateViolationUseCaseInput, CreateViolationModel> {
  final ViolationRepository _repository;

  CreateViolationUseCase(this._repository);

  @override
  Future<Either<Failure, CreateViolationModel>> execute(input) async {
    return await _repository.createViolation(
      CreateViolationRequest(
        driverIdNumber: input.driverIdNumber,
        ownerName: input.ownerName,
        ownerIdNumber: input.ownerIdNumber,
        violationAddress: input.violationAddress,
        vehicleColor: input.vehicleColor,
        vehicleNumber: input.vehicleNumber,
        violationDate: input.violationDate,
        vehicleType: input.vehicleType,
        violationTime: input.violationTime,
        reasonOfViolationId: input.reasonOfViolationId,
      ),
    );
  }
}
