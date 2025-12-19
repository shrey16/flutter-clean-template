import 'package:fpdart/fpdart.dart';

import '../error/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef ResultVoid = ResultFuture<Unit>;

abstract class UseCase<Type, Params> {
  ResultFuture<Type> call(Params params);
}

class NoParams {
  const NoParams();
}
