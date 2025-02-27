import '/config/all_imports.dart';

abstract class RemoteCreateComplaintDataSource {
  Future<CreateComplaintResponse> createComplaint(CreateComplaintRequest request);
}

class RemoteCreateComplaintDataSourceImpl extends RemoteCreateComplaintDataSource {
  final AppApi _appApi;

  RemoteCreateComplaintDataSourceImpl(this._appApi);

  @override
  Future<CreateComplaintResponse> createComplaint(
      CreateComplaintRequest request) async {
    return await _appApi.createComplaint(
      request.complaintsName,
      request.addressOfComplaint,
      request.detailOfComplaint,
      request.dateOfIncidentOrProblem,
      request.status,
      request.driverId,
    );
  }
}
