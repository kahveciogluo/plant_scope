import 'package:plant_scope/app_export.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(const SplashInitial());

  Future<void> initialize() async {
    emit(const SplashLoading());

    await Future.delayed(const Duration(seconds: 2));

    try {
      emit(const SplashNavigateToHome());
    } catch (e) {
      emit(SplashError(e.toString()));
    }
  }
}
