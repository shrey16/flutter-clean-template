import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../entities/counter.dart';
import '../repositories/counter_repository.dart';

@injectable
class GetCounter implements UseCase<Counter, NoParams> {
  GetCounter(this._repository);

  final CounterRepository _repository;

  @override
  ResultFuture<Counter> call(NoParams params) {
    return _repository.getCounter();
  }
}
