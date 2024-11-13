import '/config/all_imports.dart';

class CreateViolationUseCaseInput {
  String? driverIdNumber;
  double? priceOfViolation;
  String? violationReason;
  int? policeManId;
  String? driverName;
  String? ownerName;
  String? ownerId;
  String? vehicleNumber;
  String? vehicleType;
  String? vehicleColor;
  String? violationTime;
  String? violationDate;
  String? violationAddress;
  String? reasonForViolation;

  CreateViolationUseCaseInput({
    required this.driverIdNumber,
    required this.violationReason,
    required this.priceOfViolation,
    required this.driverName,
    required this.ownerName,
    required this.ownerId,
    required this.violationAddress,
    required this.reasonForViolation,
    required this.vehicleColor,
    required this.vehicleNumber,
    required this.violationDate,
    required this.vehicleType,
    required this.violationTime,
    required this.policeManId,
  });
}

class CreateViolationUseCase
    extends BaseUseCase<CreateViolationUseCaseInput, CreateViolationModel> {
  final CreateViolationRepository _repository;

  CreateViolationUseCase(this._repository);

  @override
  Future<Either<Failure, CreateViolationModel>> execute(input) async {
    return await _repository.createViolation(
      CreateViolationRequest(
        driverIdNumber: input.driverIdNumber,
        driverName: input.driverName,
        violationReason: input.violationReason,
        ownerName: input.ownerName,
        ownerId: input.ownerId,
        violationAddress: input.violationAddress,
        priceOfViolation: input.priceOfViolation,
        reasonForViolation: input.reasonForViolation,
        vehicleColor: input.vehicleColor,
        vehicleNumber: input.vehicleNumber,
        violationDate: input.violationDate,
        vehicleType: input.vehicleType,
        violationTime: input.violationTime,
      ),
    );
  }
}
