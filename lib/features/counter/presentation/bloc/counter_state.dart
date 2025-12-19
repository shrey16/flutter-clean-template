import 'package:equatable/equatable.dart';

import '../../domain/entities/counter.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object?> get props => [];
}

class CounterInitial extends CounterState {
  const CounterInitial();
}

class CounterLoadInProgress extends CounterState {
  const CounterLoadInProgress();
}

class CounterLoadSuccess extends CounterState {
  const CounterLoadSuccess(this.counter);

  final Counter counter;

  @override
  List<Object?> get props => [counter];
}

class CounterLoadFailure extends CounterState {
  const CounterLoadFailure(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
