import 'package:plant_scope/features/app_web_view/app_web_view_page.dart';
import 'package:plant_scope/features/onboarding/presentation/pages/onboarding_page.dart';
import '../../../app_export.dart';
import '../../../features/diagnose/presentation/pages/diagnose_page.dart';
import '../../../features/home/presentation/pages/home_page.dart';
import '../../../features/main_view/presentation/pages/main_view.dart';
import '../../../features/my_garden/presentation/pages/my_garden_page.dart';
import '../../../features/identify/presentation/pages/identify_page.dart';
import '../../../features/profile/presentation/pages/profile_page.dart';
import '../../../features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static const String splash = '/';
  static const String home = '/home';
  static const String diagnose = '/diagnose';
  static const String plants = '/plants';
  static const String myGarden = '/myGarden';
  static const String profile = '/profile';
  static const String appWebView = '/appWebView';
  static const String onboarding = '/onboarding';

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: splash,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: splash,
        name: 'splash',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const SplashPage()),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: home,
                name: 'home',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: diagnose,
                name: 'diagnose',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: DiagnosePage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: plants,
                name: 'plants',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: IdentifyPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: myGarden,
                name: 'myGarden',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MyGardenPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: profile,
                name: 'profile',
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: appWebView,
        name: 'appWebView',
        pageBuilder: (context, state) {
          final url = state.uri.queryParameters['url'];
          final pageTitle = state.uri.queryParameters['pageTitle'];
          return MaterialPage(
            key: state.pageKey,
            child: AppWebViewPage(url: url, pageTitle: pageTitle),
          );
        },
      ),
      GoRoute(
        path: onboarding,
        name: 'onboarding',
        pageBuilder: (context, state) =>
            MaterialPage(key: state.pageKey, child: const OnboardingPage()),
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
