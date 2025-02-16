import '/config/all_imports.dart';

class GetAllComplaintsInput {
  final int driverId;
  final int page;
  final int limit;
  final String orderBy;

  GetAllComplaintsInput({
    required this.driverId,
    required this.page,
    required this.limit,
    required this.orderBy,
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
        maxLimit: input.limit,
        orderBy: input.orderBy,
        page: input.page,
      ),
    );
  }
}
