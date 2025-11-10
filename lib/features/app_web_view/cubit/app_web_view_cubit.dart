import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:equatable/equatable.dart';

part 'app_web_view_state.dart';

class AppWebViewCubit extends Cubit<AppWebViewState> {
  AppWebViewCubit({required String? url, required String? pageTitle})
    : super(
        AppWebViewState(
          url: url,
          pageTitle: pageTitle,
          isLoading: true,
          progress: 0,
        ),
      );

  InAppWebViewController? webViewController;

  void setWebViewController(InAppWebViewController controller) {
    webViewController = controller;
  }

  void onLoadStart() {
    emit(state.copyWith(isLoading: true));
  }

  void onLoadStop() {
    emit(state.copyWith(isLoading: false));
  }

  void onProgressChanged(int progress) {
    emit(state.copyWith(progress: progress / 100));
  }

  void reload() {
    webViewController?.reload();
  }
}
