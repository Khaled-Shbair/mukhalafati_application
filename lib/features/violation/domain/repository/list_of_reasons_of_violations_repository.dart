import '/config/all_imports.dart';

abstract class ListOfReasonsOfViolationsRepository {
  Future<Either<Failure, ListOfReasonsOfViolationsModel>>
      listOfReasonsOfViolations();
}
