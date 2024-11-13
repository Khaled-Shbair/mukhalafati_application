import '/config/all_imports.dart';

class GetAllComplaintsInput {
  int? driverId;

  GetAllComplaintsInput({
    required this.driverId,
  });
}

class GetAllComplaintsUseCase
    extends BaseUseCase<GetAllComplaintsInput, GetAllComplaintsModel> {
  final GetAllComplaintsRepository _repository;

  GetAllComplaintsUseCase(this._repository);

  @override
  Future<Either<Failure, GetAllComplaintsModel>> execute(
      GetAllComplaintsInput input) async {
    return await _repository.getAllComplaints(
      GetAllComplaintsRequest(
        driverId: input.driverId,
      ),
    );
  }
}
