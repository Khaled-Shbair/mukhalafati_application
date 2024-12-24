import '/config/all_imports.dart';

abstract class SendRequestUpdateProfileRepository {
  Future<Either<Failure, SendRequestUpdateProfileModel>>
      sendRequestUpdateProfile(SendRequestUpdateProfileRequest request);
}
