import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/counter.dart';
import '../../domain/repositories/counter_repository.dart';
import '../datasources/counter_local_data_source.dart';

@LazySingleton(as: CounterRepository)
class CounterRepositoryImpl implements CounterRepository {
  CounterRepositoryImpl(this._localDataSource);

  final CounterLocalDataSource _localDataSource;

  @override
  ResultFuture<Counter> getCounter() async {
    try {
      final model = await _localDataSource.getCounter();
      return Right(model.toEntity());
    } catch (_) {
      return const Left(Failure('Failed to load counter.'));
    }
  }

  @override
  ResultFuture<Counter> incrementCounter() async {
    try {
      final model = await _localDataSource.incrementCounter();
      return Right(model.toEntity());
    } catch (_) {
      return const Left(Failure('Failed to increment counter.'));
    }
  }
}
