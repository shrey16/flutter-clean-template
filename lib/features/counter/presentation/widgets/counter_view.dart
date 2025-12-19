import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onOpenSettings,
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterLoadInProgress) {
              return const CircularProgressIndicator();
            }

            if (state is CounterLoadFailure) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () =>
                        context.read<CounterBloc>().add(const CounterRequested()),
                    child: const Text('Try again'),
                  ),
                ],
              );
            }

            if (state is CounterLoadSuccess) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Current count'),
                  const SizedBox(height: 8),
                  Text(
                    '${state.counter.value}',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              );
            }

            return const Text('Loading counter...');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            context.read<CounterBloc>().add(const CounterIncremented()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
