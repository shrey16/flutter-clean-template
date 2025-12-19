import 'package:equatable/equatable.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object?> get props => [];
}

class CounterRequested extends CounterEvent {
  const CounterRequested();
}

class CounterIncremented extends CounterEvent {
  const CounterIncremented();
}
