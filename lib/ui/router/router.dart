import 'package:effective_mobile_test/ui/pages/home_page/home_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '${HomePage.routePath}:0',
  routes: <GoRoute>[
    GoRoute(
      name: '$HomePage',
      path: '${HomePage.routePath}:tabIndex',
      builder: (_, state) {
        final tabIndex = int.tryParse(state.pathParameters['tabIndex']!) ?? 0;

        return HomePage(selectedTabIndex: tabIndex);
      },
    ),
  ],
);
