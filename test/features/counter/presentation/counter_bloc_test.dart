import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_template/core/error/failure.dart';
import 'package:flutter_clean_template/core/usecase/usecase.dart';
import 'package:flutter_clean_template/features/counter/domain/entities/counter.dart';
import 'package:flutter_clean_template/features/counter/domain/usecases/get_counter.dart';
import 'package:flutter_clean_template/features/counter/domain/usecases/increment_counter.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_event.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_state.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetCounter extends Mock implements GetCounter {}

class MockIncrementCounter extends Mock implements IncrementCounter {}

void main() {
  late MockGetCounter getCounter;
  late MockIncrementCounter incrementCounter;
  late CounterBloc bloc;

  setUp(() {
    getCounter = MockGetCounter();
    incrementCounter = MockIncrementCounter();
    bloc = CounterBloc(getCounter, incrementCounter);
  });

  test('initial state is CounterInitial', () {
    expect(bloc.state, const CounterInitial());
  });

  blocTest<CounterBloc, CounterState>(
    'emits [loading, success] when counter requested',
    build: () {
      when(() => getCounter(const NoParams())).thenAnswer(
        (_) async => const Right(Counter(value: 1)),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const CounterRequested()),
    expect: () => [
      const CounterLoadInProgress(),
      const CounterLoadSuccess(Counter(value: 1)),
    ],
  );

  blocTest<CounterBloc, CounterState>(
    'emits [loading, failure] when increment fails',
    build: () {
      when(() => incrementCounter(const NoParams())).thenAnswer(
        (_) async => const Left(Failure('Failed to increment counter.')),
      );
      return bloc;
    },
    act: (bloc) => bloc.add(const CounterIncremented()),
    expect: () => [
      const CounterLoadInProgress(),
      const CounterLoadFailure('Failed to increment counter.'),
    ],
  );
}
