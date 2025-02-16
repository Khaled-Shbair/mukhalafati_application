import '/config/all_imports.dart';

abstract class RemoteSendRequestUpdateProfileDataSource {
  Future<SendRequestUpdateProfileResponse> sendRequestUpdateProfile(
      SendRequestUpdateProfileRequest request);
}

class RemoteSendRequestUpdateProfileDataSourceImpl
    extends RemoteSendRequestUpdateProfileDataSource {
  final AppApi _appApi;

  RemoteSendRequestUpdateProfileDataSourceImpl(this._appApi);

  @override
  sendRequestUpdateProfile(request) async {
    return await _appApi.sendRequestUpdateProfile(
      request.driverId,
      request.name,
      request.idNumber,
      request.licenseNumber,
      request.phoneNumber,
    );
  }
}
