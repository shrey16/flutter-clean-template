import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_counter.dart';
import '../../domain/usecases/increment_counter.dart';
import 'counter_event.dart';
import 'counter_state.dart';

@injectable
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(this._getCounter, this._incrementCounter)
      : super(const CounterInitial()) {
    on<CounterRequested>(_onRequested);
    on<CounterIncremented>(_onIncremented);
  }

  final GetCounter _getCounter;
  final IncrementCounter _incrementCounter;

  Future<void> _onRequested(
    CounterRequested event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoadInProgress());
    final result = await _getCounter(const NoParams());
    result.match(
      (failure) => emit(CounterLoadFailure(failure.message)),
      (counter) => emit(CounterLoadSuccess(counter)),
    );
  }

  Future<void> _onIncremented(
    CounterIncremented event,
    Emitter<CounterState> emit,
  ) async {
    emit(const CounterLoadInProgress());
    final result = await _incrementCounter(const NoParams());
    result.match(
      (failure) => emit(CounterLoadFailure(failure.message)),
      (counter) => emit(CounterLoadSuccess(counter)),
    );
  }
}
