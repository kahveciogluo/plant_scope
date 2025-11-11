import 'app_export.dart';
import 'features/home/data/datasources/home_datasource.dart';
import 'features/home/data/datasources/home_datasource_impl.dart';
import 'features/home/data/repositories/home_repository_impl.dart';
import 'features/home/domain/repositories/home_repository.dart';
import 'features/home/domain/usecases/get_categories_usecase.dart';
import 'features/home/domain/usecases/get_questions_usecase.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/main_view/presentation/cubit/main_cubit.dart';

final ml = GetIt.instance;

Future<void> init() async {
  ml.registerLazySingleton<StorageManager>(() => StorageManager());

  ml.registerLazySingleton<LocaleManager>(() => LocaleManager());

  ml.registerLazySingleton<GlobalOverlayManager>(() => GlobalOverlayManager());

  ml.registerLazySingleton<UserManager>(() => UserManager(ml()));

  await ml<UserManager>().initialize();

  ml.registerLazySingleton<NetworkManager>(
    () => NetworkManager(userManager: ml(), localeManager: ml()),
  );

  await ml<NetworkManager>().initializeInterceptor();

  _initMain();
  _initHome();
}

void _initMain() {
  ml.registerFactory(() => MainCubit());
}

void _initHome() {
  ml.registerFactory(
    () => HomeBloc(getQuestionsUseCase: ml(), getCategoriesUsecase: ml()),
  );

  ml.registerLazySingleton(() => GetQuestionsUseCase(ml()));
  ml.registerLazySingleton(() => GetCategoriesUsecase(ml()));

  ml.registerLazySingleton<HomeRepository>(
    () => QuestionRepositoryImpl(remoteDataSource: ml()),
  );

  ml.registerLazySingleton<HomeDataSource>(
    () => HomeDataSourceImpl(networkManager: ml()),
  );
}
