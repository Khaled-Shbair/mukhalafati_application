import '/config/all_imports.dart';

class CreateComplaintInput {
  String? complaintsName;

  String? addressOfComplaint;

  String? detailOfComplaint;

  String? dateOfIncidentOrProblem;
  bool? statusOfComplaint;

  int? driverId;

  CreateComplaintInput({
    required this.driverId,
    required this.addressOfComplaint,
    required this.complaintsName,
    required this.dateOfIncidentOrProblem,
    required this.detailOfComplaint,
    required this.statusOfComplaint,
  });
}

class CreateComplaintUseCase
    extends BaseUseCase<CreateComplaintInput, CreateComplaintModel> {
  final CreateComplaintRepository _repository;

  CreateComplaintUseCase(this._repository);

  @override
  Future<Either<Failure, CreateComplaintModel>> execute(
      CreateComplaintInput input) async {
    return await _repository.createComplaint(
      CreateComplaintRequest(
        driverId: input.driverId,
        addressOfComplaint: input.addressOfComplaint,
        complaintsName: input.complaintsName,
        dateOfIncidentOrProblem: input.dateOfIncidentOrProblem,
        detailOfComplaint: input.detailOfComplaint,
        status: input.statusOfComplaint,
      ),
    );
  }
}
