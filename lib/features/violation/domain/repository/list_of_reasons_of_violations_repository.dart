import '/config/all_imports.dart';

abstract class ListReasonsOfViolationsRepository {
  Future<Either<Failure, ListOfReasonsOfViolationsModel>>
      listOfReasonsOfViolations();
}
