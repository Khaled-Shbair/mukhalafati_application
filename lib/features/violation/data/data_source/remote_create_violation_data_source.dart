import '/config/all_imports.dart';

abstract class RemoteCreateViolationDataSource {
  Future<CreateViolationResponse> createViolation(
      CreateViolationRequest request);
}

class RemoteCreateViolationDataSourceImpl
    extends RemoteCreateViolationDataSource {
  final AppApi _appApi;

  RemoteCreateViolationDataSourceImpl(this._appApi);

  @override
  Future<CreateViolationResponse> createViolation(
      CreateViolationRequest request) async {
    return await _appApi.createViolation(
      request.priceOfViolation,
      request.violationReason,
      request.violationDate,
      request.violationTime,
      request.violationAddress,
      request.driverIdNumber,
      request.policeManId,
      request.driverName,
      request.ownerName,
      request.ownerId,
      request.vehicleNumber,
      request.vehicleType,
      request.vehicleColor,
    );
  }
}
