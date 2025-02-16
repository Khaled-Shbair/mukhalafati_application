import '/config/all_imports.dart';

abstract class HomePoliceManRepo {
  Future<Either<Failure, HomePoliceManModel>> homePoliceMan();
}
