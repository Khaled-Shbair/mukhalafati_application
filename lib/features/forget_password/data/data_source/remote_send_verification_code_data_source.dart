import '/config/all_imports.dart';

abstract class RemoteSendVerificationCodeDataSource {
  Future<SendVerificationCodeResponse> sendVerificationCode(
      SendVerificationCodeRequest request);
}

class RemoteSendVerificationCodeDataSourceImpl
    extends RemoteSendVerificationCodeDataSource {
  final AppApi _appApi;
  final SharedPreferencesController _sharedPreferences;

  RemoteSendVerificationCodeDataSourceImpl(
    this._appApi,
    this._sharedPreferences,
  );

  @override
  Future<SendVerificationCodeResponse> sendVerificationCode(request) async {
    return await _appApi.sendVerificationCode(
      request.phoneNumber,
    );
  }
}
