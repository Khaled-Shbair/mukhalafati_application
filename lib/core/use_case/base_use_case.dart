import '/config/all_imports.dart';

// Use when get data by sent inputs
abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}

// Use when get data without sent inputs
abstract class BaseOutUseCase<Out> {
  Future<Either<Failure, Out>> execute();
}
