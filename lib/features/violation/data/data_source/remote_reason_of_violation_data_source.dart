
import '/config/all_imports.dart';

abstract class RemoteReasonOfViolationDataSource {
  Future<ReasonOfViolationResponse> reasonOfViolation(
      ReasonOfViolationRequest request);
}

class RemoteReasonOfViolationDataSourceImpl
    extends RemoteReasonOfViolationDataSource {
  final AppApi _appApi;

  RemoteReasonOfViolationDataSourceImpl(this._appApi);

  @override
  Future<ReasonOfViolationResponse> reasonOfViolation(request) async {
    return await _appApi.reasonOfViolation(request.id);
  }
}
