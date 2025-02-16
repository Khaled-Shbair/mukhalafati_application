import '/config/all_imports.dart';

abstract class RemoteGetAllComplaintsDataSource {
  Future<GetAllComplaintsForDriverResponse> getAllComplaints(
      GetAllComplaintsRequest request);
}

class RemoteGetAllComplaintsDataSourceImpl
    extends RemoteGetAllComplaintsDataSource {
  final AppApi _appApi;

  RemoteGetAllComplaintsDataSourceImpl(this._appApi);

  @override
  Future<GetAllComplaintsForDriverResponse> getAllComplaints(
      GetAllComplaintsRequest request) async {
    return await _appApi.getAllComplaintsForDriver(
      request.driverId,
      request.page,
      request.maxLimit,
      request.orderBy,
    );
  }
}
