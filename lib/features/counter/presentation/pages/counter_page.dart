import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/app_router.dart';
import '../../../../core/di/injection.dart';
import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../widgets/counter_view.dart';

@RoutePage()
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CounterBloc>()..add(const CounterRequested()),
      child: CounterView(
        onOpenSettings: () => context.router.push(const SettingsRoute()),
      ),
    );
  }
}
