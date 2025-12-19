import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_clean_template/features/counter/domain/entities/counter.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_bloc.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_event.dart';
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_state.dart';
import 'package:flutter_clean_template/features/counter/presentation/widgets/counter_view.dart';

class MockCounterBloc extends MockBloc<CounterEvent, CounterState>
    implements CounterBloc {}

void main() {
  testWidgets('CounterView shows current count', (tester) async {
    final bloc = MockCounterBloc();

    whenListen(
      bloc,
      const Stream<CounterState>.empty(),
      initialState: const CounterLoadSuccess(Counter(value: 2)),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<CounterBloc>.value(
          value: bloc,
          child: CounterView(onOpenSettings: () {}),
        ),
      ),
    );

    expect(find.text('Current count'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });
}
