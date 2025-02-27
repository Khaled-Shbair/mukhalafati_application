import '/config/all_imports.dart';

abstract class RemoteDriverViolationsDataSource {
  Future<DriverViolationsResponse> getDriverViolations(
      DriverViolationsRequest request);
}

class RemoteDriverViolationsDataSourceImpl
    extends RemoteDriverViolationsDataSource {
  final AppApi _appApi;

  RemoteDriverViolationsDataSourceImpl(this._appApi);

  @override
  Future<DriverViolationsResponse> getDriverViolations(
      DriverViolationsRequest request) async {
    return await _appApi.getViolationsByDriver(
      request.driverId,
      request.page,
      request.limit,
    );
  }
}
