import 'app_export.dart';
import 'features/home/data/datasources/home_datasource.dart';
import 'features/home/data/datasources/home_datasource_impl.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_questions_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/main_view/presentation/cubit/main_cubit.dart';

final ml = GetIt.instance;

Future<void> init() async {
  // Core - StorageManager (singleton pattern, creates own FlutterSecureStorage)
  ml.registerLazySingleton<StorageManager>(() => StorageManager());

  // Core - LocaleManager
  ml.registerLazySingleton<LocaleManager>(() => LocaleManager());

  // Core - GlobalOverlayManager (for loading, popups, etc.)
  ml.registerLazySingleton<GlobalOverlayManager>(() => GlobalOverlayManager());

  // Core - UserManager (depends on StorageManager)
  ml.registerLazySingleton<UserManager>(() => UserManager(ml()));

  // Initialize UserManager
  await ml<UserManager>().initialize();

  // Core - NetworkManager (needs UserManager and LocaleManager)
  ml.registerLazySingleton<NetworkManager>(
    () => NetworkManager(userManager: ml(), localeManager: ml()),
  );

  // Initialize NetworkManager interceptor (cache device info, app version, etc.)
  await ml<NetworkManager>().initializeInterceptor();

  // Features
  _initMain();
  _initHome();
}

void _initMain() {
  // Cubit
  ml.registerFactory(() => MainCubit());
}

void _initHome() {
  // Bloc
  ml.registerFactory(() => HomeBloc(getQuestionsUseCase: ml()));

  // UseCases
  ml.registerLazySingleton(() => GetQuestionsUseCase(ml()));

  // Repository
  ml.registerLazySingleton<HomeRepository>(
    () => QuestionRepositoryImpl(remoteDataSource: ml()),
  );

  // DataSources
  ml.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(networkManager: ml()),
  );
}
