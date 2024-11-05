import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/config/all_imports.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST(ApiConstants.driverLogin)
  Future<DriverLoginResponse> driverLogin(
      @Field(ApiKeys.inputLicenseNumber) licenseNumber,
      @Field(ApiKeys.inputPassword) password,
      @Field(ApiKeys.language) language);

  @POST(ApiConstants.policeManLogin)
  Future<PoliceManLoginResponse> policeManLogin(
      @Field(ApiKeys.inputJobNumber) jobNumber,
      @Field(ApiKeys.inputPassword) password,
      @Field(ApiKeys.language) language);
}
