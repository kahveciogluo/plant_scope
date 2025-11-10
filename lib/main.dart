import 'app_export.dart';
import 'core/managers/global_overlay_manager/widgets/global_overlay_widget.dart';
import 'features/main_view/presentation/cubit/main_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await di.init();

  runApp(
    EasyLocalization(
      supportedLocales: di.ml<LocaleManager>().supportedLocales,
      path: LocaleManager.path,
      fallbackLocale: LocaleManager.fallbackLocale,
      useOnlyLangCode: LocaleManager.useOnlyLangCode,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<MainCubit>(create: (_) => di.ml<MainCubit>())],
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme,
        darkTheme: ThemeManager.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        builder: (context, child) {
          return Stack(
            children: [
              child ?? const SizedBox.shrink(),
              const GlobalOverlayWidget(),
            ],
          );
        },
      ),
    );
  }
}
