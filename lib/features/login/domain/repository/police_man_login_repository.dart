import '/config/all_imports.dart';

abstract class PoliceManLoginRepository {
  Future<Either<Failure, PoliceManLoginModel>> login(
      PoliceManLoginRequest request);
}
