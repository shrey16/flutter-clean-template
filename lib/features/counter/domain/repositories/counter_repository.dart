import '../../../../core/usecase/usecase.dart';
import '../entities/counter.dart';

abstract class CounterRepository {
  ResultFuture<Counter> getCounter();
  ResultFuture<Counter> incrementCounter();
}
