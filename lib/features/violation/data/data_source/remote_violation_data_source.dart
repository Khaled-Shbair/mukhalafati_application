import '/config/all_imports.dart';

abstract class RemoteViolationDataSource {
  Future<CreateViolationResponse> createViolation(
      CreateViolationRequest request);

  Future<AllReasonsOfViolationResponse> getAllReasonsForViolation();

  Future<AllViolationResponse> getAllViolation(AllViolationRequest request);

  Future<GetViolationDetailsResponse> getViolationDetailsById(
      GetViolationDetailsRequest request);
}

class RemoteViolationDataSourceImpl extends RemoteViolationDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteViolationDataSourceImpl(this._appApi, this._sharedPreferences);

  @override
  Future<CreateViolationResponse> createViolation(
      CreateViolationRequest request) async {
    return await _appApi.createViolation(
      request.violationDate,
      request.violationAddress,
      request.violationTime,
      request.vehicleNumber,
      request.vehicleType,
      request.reasonOfViolationId,
      request.vehicleColor,
      request.ownerName,
      request.ownerIdNumber,
      _sharedPreferences.getString(SharedPreferencesKeys.language),
      request.driverIdNumber,
      _sharedPreferences.getInt(SharedPreferencesKeys.userId),
    );
  }

  @override
  Future<AllReasonsOfViolationResponse> getAllReasonsForViolation() async {
    return await _appApi.listOfReasonsOfViolations();
  }

  @override
  Future<AllViolationResponse> getAllViolation(request) async {
    return await _appApi.getAllViolation(
      _sharedPreferences.getInt(SharedPreferencesKeys.userId),
      request.limit,
      request.page,
    );
  }

  @override
  Future<GetViolationDetailsResponse> getViolationDetailsById(
      GetViolationDetailsRequest request) async {
    return await _appApi.getViolationDetailsById(request.violationId);
  }
}
