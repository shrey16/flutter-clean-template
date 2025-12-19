import 'package:auto_route/auto_route.dart';

import '../../features/counter/presentation/pages/counter_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CounterRoute.page, initial: true),
        AutoRoute(page: SettingsRoute.page),
      ];
}
