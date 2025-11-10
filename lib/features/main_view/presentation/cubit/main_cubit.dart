import '../../../../app_export.dart';

class MainCubit extends Cubit<int> {
  MainCubit() : super(0);

  void changeTab(int index) => emit(index);
}
