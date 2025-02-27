import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '/config/all_imports.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @POST(ApiConstants.updateDriverFcmToken)
  Future<UpdateFcmTokenResponse> updateDriverFcmToken(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.inputFcmToken) fcmToken,
    @Field(ApiKeys.language) language,
  );

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

  @POST(ApiConstants.createComplaint)
  Future<CreateComplaintResponse> createComplaint(
    @Field(ApiKeys.complaintsName) complaintsName,
    @Field(ApiKeys.address) addressOfComplaint,
    @Field(ApiKeys.detailOfComplaint) detailOfComplaint,
    @Field(ApiKeys.dateOfIncidentOrProblem) dateOfIncidentOrProblem,
    @Field(ApiKeys.status) status,
    @Field(ApiKeys.driverId) driverId,
  );

  @POST(ApiConstants.forgetPasswordDriver)
  Future<DriverForgotPasswordResponse> forgetPasswordDriver(
    @Field(ApiKeys.inputLicenseNumber) licenseNumber,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.forgetPasswordPoliceMan)
  Future<PoliceManForgotPasswordResponse> forgetPasswordPoliceMan(
    @Field(ApiKeys.inputJobNumber) jobNumber,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.changePasswordDriver)
  Future<DriverChangePasswordResponse> changePasswordDriver(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.newPassword) newPassword,
    @Field(ApiKeys.confirmPassword) confirmPassword,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.changePasswordPoliceMan)
  Future<PoliceManChangePasswordResponse> changePasswordPoliceMan(
    @Field(ApiKeys.policeManId) policeManId,
    @Field(ApiKeys.newPassword) newPassword,
    @Field(ApiKeys.confirmPassword) confirmPassword,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.getAllComplaintsForDriver)
  Future<GetAllComplaintsForDriverResponse> getAllComplaintsForDriver(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.page) page,
    @Field(ApiKeys.maxLimit) limit,
    @Field(ApiKeys.orderBy) orderBy,
  );

  @POST(ApiConstants.getDriverViolations)
  Future<DriverViolationsResponse> getViolationsByDriver(
    @Field('input_driver_id') driverId,
    @Field(ApiKeys.page) page,
    @Field(ApiKeys.maxLimit) limit,
  );

  @POST(ApiConstants.searchForDriver)
  Future<SearchForDriverResponse> searchForDriver(
    @Field(ApiKeys.inputLicenseNumber) inputLicenseNumber,
    @Field(ApiKeys.language) language,
  );

  @POST(ApiConstants.searchOnResultsTestsOfLicense)
  Future<SearchOnResultsTestsOfLicenseResponse> searchOnResultsTestsOfLicense(
    @Field(ApiKeys.idNumber) idNumber,
  );

  @POST(ApiConstants.createViolation)
  Future<CreateViolationResponse> createViolation(
    @Field(ApiKeys.violationDate) violationDate,
    @Field(ApiKeys.violationAddress) violationAddress,
    @Field(ApiKeys.violationTime) violationTime,
    @Field(ApiKeys.vehicleNumber) vehicleNumber,
    @Field(ApiKeys.vehicleType) vehicleType,
    @Field(ApiKeys.reasonOfViolationId) reasonOfViolationId,
    @Field(ApiKeys.vehicleColor) vehicleColor,
    @Field(ApiKeys.ownerName) ownerName,
    @Field(ApiKeys.ownerIdNumber) ownerIdNumber,
    @Field(ApiKeys.language) language,
    @Field(ApiKeys.driverIdNumber) driverIdNumber,
    @Field(ApiKeys.policeManId) policeId,
  );

  @GET(ApiConstants.listOfReasonsOfViolations)
  Future<AllReasonsOfViolationResponse> listOfReasonsOfViolations();

  @POST(ApiConstants.reasonOfViolation)
  Future<ReasonOfViolationResponse> reasonOfViolation(
    @Field(ApiKeys.inputId) id,
  );

  @POST(ApiConstants.paymentViolation)
  Future<PaymentViolationResponse> paymentViolation(
    @Field(ApiKeys.violationId) violationId,
    @Field(ApiKeys.paymentDateAndTime) paymentDateAndTime,
    @Field(ApiKeys.violationState) violationState,
    @Field(ApiKeys.violationPayedBy) violationPayedBy,
  );

  @POST(ApiConstants.getAllViolation)
  Future<AllViolationResponse> getAllViolation(
    @Field(ApiKeys.inputId) policeManId,
    @Field(ApiKeys.maxLimit) limit,
    @Field(ApiKeys.page) page,
  );

  @POST(ApiConstants.sendVerificationCode)
  Future<SendVerificationCodeResponse> sendVerificationCode(
    @Field(ApiKeys.phoneNumber) phoneNumber,
  );

  @POST(ApiConstants.sendRequestUpdateProfile)
  Future<SendRequestUpdateProfileResponse> sendRequestUpdateProfile(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.name) name,
    @Field(ApiKeys.idNumber) idNumber,
    @Field(ApiKeys.licenseNumber) licenseNumber,
    @Field(ApiKeys.phoneNumber) phoneNumber,
  );

  @POST(ApiConstants.getViolationDetailsById)
  Future<GetViolationDetailsResponse> getViolationDetailsById(
      @Field(ApiKeys.violationId) violationId);

  @POST(ApiConstants.saveNotification)
  Future saveNotification(
    @Field(ApiKeys.driverId) driverId,
    @Field(ApiKeys.title) title,
    @Field(ApiKeys.content) content,
    @Field(ApiKeys.timeSend) timeSend,
    @Field(ApiKeys.dateSend) dateSend,
  );

  @POST(ApiConstants.homePoliceMan)
  Future<HomePoliceManResponse> homePoliceMan(
      @Field(ApiKeys.inputId) policeManId);

  @POST(ApiConstants.updateNotificationStatus)
  Future updateNotificationStatus(@Field(ApiKeys.userId) driverId);

  @POST(ApiConstants.getAllNotification)
  Future<NotificationsResponse> getAllNotification(
      @Field(ApiKeys.inputId) driverId);

  @POST(ApiConstants.getHomeDriverData)
  Future<HomeDriverDataResponse> getHomeDriverData(
      @Field(ApiKeys.inputId) driverId);

  @POST(ApiConstants.deleteAllNotification)
  Future deleteAllNotification(@Field(ApiKeys.userId) driverId);

  @POST(ApiConstants.deleteDriverNotificationById)
  Future deleteDriverNotificationById(
    @Field(ApiKeys.userId) driverId,
    @Field(ApiKeys.notificationId) notificationId,
  );
}
